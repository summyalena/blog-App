require 'rails_helper'

RSpec.describe 'PostShow', type: :feature do
  describe 'post show test' do
    before(:each) do
      @user = User.create!(Name: 'Example User', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                           Bio: 'I am a user')
      @user2 = User.create!(Name: 'Example User2', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user3 = User.create!(Name: 'Example User3', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user4 = User.create!(Name: 'Example User4', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')

      @post = Post.create!(Title: 'This is my first post', Text: 'This is my first post', comment_counter: 0,
                           like_counter: 3, AuthorId: @user.id)
      @post2 = Post.create!(Title: 'This is my second post', Text: 'This is my second post', comment_counter: 0,
                            like_counter: 3, AuthorId: @user.id)
      @post3 = Post.create!(Title: 'This is my third post', Text: 'This is my third post', comment_counter: 0,
                            like_counter: 3, AuthorId: @user.id)
      @post4 = Post.create!(Title: 'This is my fourth post', Text: 'This is my fourth post', comment_counter: 0,
                            like_counter: 3, AuthorId: @user.id)
      @post5 = Post.create!(Title: 'This is my fifth post', Text: 'This is my fifth post', comment_counter: 0,
                            like_counter: 3, AuthorId: @user.id)

      @comment1 = Comment.create!(text: 'This is my first comment', AuthorId: @user2.id, PostId: @post.id)
      @comment2 = Comment.create!(text: 'This is my second comment', AuthorId: @user3.id, PostId: @post.id)
      @comment3 = Comment.create!(text: 'This is my third comment', AuthorId: @user4.id, PostId: @post.id)
      @comment4 = Comment.create!(text: 'This is my fourth comment', AuthorId: @user.id, PostId: @post.id)

      visit user_post_path(@user, @post)
    end

    it 'displays the post text' do
      expect(page).to have_content(@post.Text)
    end

    it 'display the comment counter' do
      expect(page).to have_content('Comments: 4')
    end

    it 'displays the user name of commentor' do
      expect(page).to have_content(@user.Name)
      expect(page).to have_content(@user2.Name)
      expect(page).to have_content(@user3.Name)
      expect(page).to have_content(@user4.Name)
    end

    it 'displays the post comments' do
      expect(page).to have_content(@comment3.text)
      expect(page).to have_content(@comment4.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment1.text)
    end

    it 'displays the post likes counter' do
      expect(page).to have_content(@post.like_counter)
    end

    it 'displays the post author name' do
      expect(page).to have_content(@post.user.Name)
    end

    it 'displays the post title' do
      expect(page).to have_content(@post.Title)
    end
  end
end
