require 'rails_helper'

RSpec.describe "posts controller", type: :request do
  describe "GET user routes" do
    describe "GET /users/:user_id/posts" do
      before(:example) { get "/users/1/posts" }

      it "should return the correct posts for a user" do
        expect(response).to have_http_status(:ok)
      end

      it "should render the correct template" do
        expect(response).to render_template(:index)
      end

      it "should render the correct text in the template" do
        expect(response.body).to include('Welcome to user 1 post on "Relo-blog"')
      end
    end

    describe "GET /users/:user_id/posts/:id" do
      before(:example) { get "/users/1/posts/3" }

      it "should return the correct post for a user" do
        expect(response).to have_http_status(:ok)
      end

      it "should render the correct template" do
        expect(response).to render_template(:show)
      end

      it "should render the correct text in the template" do
        expect(response.body).to include('Showing user 1 post 3')
      end
    end
  end
end