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

end
