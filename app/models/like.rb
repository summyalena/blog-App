class Like < ActiveRecord::Base
  belongs_to :author, foreign_key: :author_id, primary_key: :uid
  class_name :User
  belongs_to :post

  def update_likes_counter
    post.increment!(:likes_count)
  end
end
