class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id].to_i)
  end

  def show
    @post = Post.joins(:user).where(user: { id: params[:user_id] }).find(params[:id])
    @comments = @post.comments
  end
end
