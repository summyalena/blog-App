class Comment < ActiveRecord::Base
  belongs_to :author, :foreign_key => :author_id, :primary_key => :uid
  belongs_to :post

  def update_comments_counter
    post.increment!(:comments_count)
  end
end
