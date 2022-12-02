class Post < ActiveRecord::Base
  belongs_to :author, foreign_key: :author_id, primary_key: :uid
  class_name :User
  has_many :comments
  has_many :likes

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def recent_five_comments
    comments.last(5)
  end
end
