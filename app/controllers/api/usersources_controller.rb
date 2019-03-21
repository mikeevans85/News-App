class Api::UsersourcesController < ApplicationController
  before_action :authenticate_user
  require "http"

  #Google Translate API requirements
  require "google/cloud/translate"
  project_id = "apt-aleph-225715"
  translate = Google::Cloud::Translate.new project: project_id

  def index #This method creates the news feed
    api_url = params[:api_url] 
    @usersources = UserSource.where(user_id: current_user.id)
    @data = []
    @usersources.each do |usersource| #This creats an array of API calls to make
      @data << "https://newsapi.org/v2/top-headlines?sources=#{usersource.source.api_url}&apiKey=#{ENV['API_KEY']}"
    end
    @response = []
    @data.each do |x| #This puts the API call data into a new array
      @response << HTTP.get(x)
    end
    @articles = []
    @response.each do |response| #This parses the data
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
    source_id: params[:source_id],
    translated: params["translated"]
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
    # text = "Главные новости политики, экономики и бизнеса, комментарии аналитиков"
    target = "en"

    @translation = translate.translate text, to: target

    # puts "Text: #{text}"
    # puts "Translation: #{translation}"
    # render json: {text: text, translation: translation}
    render "translate.json.jbuilder"

  end

  def update
    @usersource = Usersource.find_by(id: params[:id])
    @usersource.translated

  end

  def destroy
    @usersource = UserSource.find_by(source_id: params[:id], user_id: current_user.id)
    @usersource.destroy
    render json: {message: "Source removed."}
  end
end
