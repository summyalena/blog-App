class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end

third_post = Post.create(user: first_user, title: 'keeper', text: 'This is my third post')

Comment.create(post: third_post, user: first_user, text: 'i love you!')
