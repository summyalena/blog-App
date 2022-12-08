require_relative 'rails_helper'

RSpec.describe "Posts", type: :request do
  before(:each) do
    @user = User.create(name: 'Alena', posts_counter: 2)
    @post = Post.create(
      # author_id: @user,
      title: 'Post title',
      text: 'Post text',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(text: 'You are beautiful')
    Comment.create(text: '')
    Comment.create(text: 'mamah love you')
  end

  describe "GET /index" do
    before(:each) do
      get user_posts_path(@user)
    end
    it "returns http success" do
      expect(response).to have_http_status(200)
    end
    it "return rendered template" do
      expect(response).to render_template(:index)
    end
    it "response body includes placeholer" do
      expect(response.body).to include "Find me in app/views/posts/index.html.erb"
  end

  describe "GET /show" do
    before(:each) do
      get user_posts_path(@user, @post)
    end

    it "returns http success" do
      get "/posts/show"
      expect(response).to have_http_status(200)
    end
    it "rendered template" do
      get "/posts/show"
      expect(response).to render_template(:show)
    end
    it "check for placeholder text" do
      expect(response.body).to include "Find me in app/views/posts/show.html.erb"
    end
  end

end
