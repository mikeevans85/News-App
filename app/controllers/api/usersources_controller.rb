class Api::UsersourcesController < ApplicationController
  before_action :authenticate_user

  def index
    @feed = current_user.usersources
    render "index.json.jbuilder"
  end
end
