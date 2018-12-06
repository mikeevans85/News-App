class Api::UsersourcesController < ApplicationController
  before_action :authenticate_user
require "http"

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
      @articles.concat response.parse["articles"]
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

  def destroy
    @usersource = UserSource.find_by(id: params[:id])
    @usersource.destroy
    render json: {message: "Source removed."}
  end
end
