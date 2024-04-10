require 'rails_helper'

RSpec.describe Api::FeaturesController, type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get api_features_path
      expect(response).to have_http_status(:success)
    end
  end
end
