class Api::UsersourcesController < ApplicationController
  before_action :authenticate_user
  require "http"
  require "google/cloud/translate"
  project_id = "apt-aleph-225715"
  translate = Google::Cloud::Translate.new project: project_id

  def index
    @usersources = UserSource.where(user_id: current_user.id)
    @data = []
    @usersources.each do |usersource|
      @data << "https://newsapi.org/v2/top-headlines?sources=#{usersource.source.api_url}&apiKey=#{ENV['API_KEY']}"
    end
    @response = []
    @data.each do |x|
      @response << HTTP.get(x)
    end
    @articles = []
    @response.each do |response|
      articles = response.parse["articles"]
      articles = articles.map do |article|
        source = Source.find_by(api_url: article["source"]["id"])
        article["source_logo"] = source ? source.image_url : "no image"
        article
      end
      @articles.concat articles
    end
    render "index.json.jbuilder" 
  end

  def create
    @list = UserSource.new(
    user_id: current_user.id,
    source_id: params[:source_id]
    # translated: params["translated"]
    )
    if @list.save
      render "index.json.jbuilder"
    else
      render json: {errors: @list.errors.full_messages}, status: 422
    end
  end

  def translate
    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new project: project_id 

    text = params[:title]
    target = "en"

    translation = translate.translate text, to: target

    puts "Text: #{text}"
    puts "Translation: #{translation}"
    render json: {text: text, translation: translation}

  end

  def destroy
    @usersource = UserSource.find_by(source_id: params[:id], user_id: current_user.id)
    @usersource.destroy
    render json: {message: "Source removed."}
  end
end
