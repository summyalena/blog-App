require 'rails_helper'
RSpec.describe 'PostIndex', type: :feature do
  describe 'post index test' do
    before(:each) do
      @user = User.create!(Name: 'Example User', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                           Bio: 'I am a use')
      visit root_path
      @post = Post.create!(Title: 'Post', Text: 'This is a post', comment_counter: 3,
                           like_counter: 3, AuthorId: @user.id)
      @post2 = Post.create!(Title: 'Post2', Text: 'This is a post2', comment_counter: 3,
                            like_counter: 3, AuthorId: @user.id)
      @post3 = Post.create!(Title: 'Post3', Text: 'This is a post3', comment_counter: 3,
                            like_counter: 3, AuthorId: @user.id)
      @post4 = Post.create!(Title: 'Post4', Text: 'This is a post4', comment_counter: 3,
                            like_counter: 3, AuthorId: @user.id)
      @post5 = Post.create!(Title: 'Post5', Text: 'This is a post5', comment_counter: 3,
                            like_counter: 3, AuthorId: @user.id)
      @comment1 = Comment.create!(text: 'This is a comment', AuthorId: @user.id, PostId: @post.id)
      @comment2 = Comment.create!(text: 'This is a comment2', AuthorId: @user.id, PostId: @post.id)
      @comment3 = Comment.create!(text: 'This is a comment3', AuthorId: @user.id, PostId: @post.id)
      visit user_posts_path(@user)
    end
    it 'displays the user name' do
      expect(page).to have_content(@user.Name)
    end
    it 'displays the user photo' do
      expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end
    it 'displays the user posts counter' do
      expect(page).to have_content(@user.post_counter)
    end
    it 'displays the post recent comments' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment3.text)
    end
    it 'displays the post title' do
      expect(page).to have_content(@post.Title)
    end
    it 'displays the post comments counter' do
      expect(page).to have_content(@post.comment_counter)
    end
    it 'displays the post comments' do
      expect(page).to have_content(@post.comment_counter)
    end
    it 'displays the post likes counter' do
      expect(page).to have_content(@post.like_counter)
    end
    it 'displays the post author name' do
      expect(page).to have_content(@post.user.Name)
    end
    it 'redirects to posts show page' do
      click_link @post4.Title
      expect(page).to have_current_path user_post_path(@user, @post4)
    end
  end
end
