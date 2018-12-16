class Api::SourcesController < ApplicationController
  def index
    @sources = Source.all
    @sources = @sources.order(:name => :asc)
    render "index.json.jbuilder"
  end

  def show
    @source = Source.find_by(id: params["id"])
    render "show.json.jbuilder"
  end

  # def update
  #   @source = Source.find_by(id: params["id"])
  #   @source.translated = params["translated"] || @source.translated
  #   if @source.save
  #     render "show.json.jbuilder"
  #   else
  #     render json: {errors: @source.errors.full_messages}, status: 422
  #   end
  # end
end
