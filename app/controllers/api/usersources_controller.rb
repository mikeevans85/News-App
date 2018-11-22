class Api::UsersourcesController < ApplicationController
  before_action :authenticate_user

  def index
    @feed = current_user.usersources
    render "index.json.jbuilder"
  end

  def create
    @list = UserSource.new(
    user_id: current_user.id,
    source_id: params["source_id"],
    translated: params["translated"]
    )
    if @list.save
      render "index.json.jbuilder"
    else
      render json: {errors: @list.errors.full_messages}, status: 422
    end
  end

  def destroy
    @usersource = Usersource.find_by(id: params[:id])
    @usersource.destroy
    render json: {message: "Source removed."}
  end
end
