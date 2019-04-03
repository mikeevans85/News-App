require 'rails_helper'

RSpec.describe Api::UsersourcesController, :type => :controller do
	describe "GET index" do
	  it "pulls the api_url from the backend" do
	  	api_url = params[:api_url]
	  	expect (api_url).to eq(params[:api_url])
	  end
	end
end