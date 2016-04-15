require 'rails_helper'

RSpec.describe DealDollarsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to be_success
    end

    it "renders the index template" do
    	get :index
    	expect(response).to render_template('index')
    end
  end
end
