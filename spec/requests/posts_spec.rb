require 'rails_helper'

RSpec.describe "posts controller", type: :request do
  describe "GET posts routes" do
    describe "GET /users/:user_id/posts" do
      before(:example) { get "/users/1/posts" }

      it "should return 200 http_status_code" do
        expect(response).to have_http_status(:ok)
      end

      it "should render the correct template" do
        expect(response).to render_template(:index)
      end

      it "should render the correct text in the template" do
        expect(response.body).to eq('Posts#index')
      end
    end

    describe "GET /users/:user_id/posts/:id" do
      before(:example) { get "/users/1/posts/3" }

      it "should return 200 http_status_code" do
        expect(response).to have_http_status(:ok)
      end

      it "should render the correct template" do
        expect(response).to render_template(:show)
      end

      it "should render the correct text in the template" do
        expect(response.body).to include('Posts#show')
      end
    end
  end
end
