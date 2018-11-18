class Api::SourcesController < ApplicationController
  def index
    @sources = Source.all
    @sources = @sources.order(:name => :asc)

    render "index.json.jbuilder"
  end
end
