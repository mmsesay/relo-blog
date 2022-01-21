require 'rails_helper'

RSpec.describe "users controller", type: :request do
  describe "GET user routes" do
    describe "GET /users" do
      before(:example) { get "/users" }

      it "should return 200 http_status_code" do
        expect(response).to have_http_status(:ok)
      end

      it "should render the correct template" do
        expect(response).to render_template(:index)
      end
    end

    describe "GET /users/:id" do
      before(:example) { get "/users/1" }

      it "should return 200 http_status_code" do
        expect(response).to have_http_status(:ok)
      end

      it "should render the correct template" do
        expect(response).to render_template(:show)
      end
    end
  end
end
