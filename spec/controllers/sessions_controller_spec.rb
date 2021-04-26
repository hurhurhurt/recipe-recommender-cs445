require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #clear" do
    it "returns http success" do
      get :clear
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #debug" do
    it "returns http success" do
      get :debug
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #failure" do
    it "returns http success" do
      get :failure
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
