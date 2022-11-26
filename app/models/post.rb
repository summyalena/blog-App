class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :likes
  
    def update_posts_counter
      user.increment!(:post_counter)
    end
  
    def recent_five_comments
      comments.last(5)
    end
  end
  