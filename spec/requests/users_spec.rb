require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:each) { get root_path }
    it "returns http success" do
      expect(response).to have_http_status(200)
    end
    it "rendered template" do
      expect(response).to render_template(:index)
    end
    it "check for placeholder text" do
      expect(response.body).to include "Find me in app/views/users/index.html.erb"
    end
  end

  describe "GET /show" do
    before(:each) do
      @author = User.create(name: 'Abby', posts_counter: 0, photo: '', bio: '')
      get user_path(@author)
    end
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(200)
    end
    it "rendered template" do
      get "users/show"
      expect(response).to render_template(:show)
    end
    it "check for placeholder text" do
      get "users/show"
      expect(response.body).to include "Find me in app/views/users/show.html.erb"
    end
  end

end
