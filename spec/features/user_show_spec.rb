require 'rails_helper'

RSpec.describe 'UsersShow', type: :feature do
  describe 'user show page' do
    before(:each) do
      @user1 = User.create!(Name: 'User', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user2 = User.create!(Name: 'User2', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user3 = User.create!(Name: 'User3', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user4 = User.create!(Name: 'User4', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user5 = User.create!(Name: 'User5', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')

      visit root_path

      @post = Post.create!(Title: 'This is a post title1', Text: ' This is a Text', comment_counter: 3,
                           like_counter: 3, AuthorId: @user1.id)
      @post2 = Post.create!(Title: 'This is a post title2', Text: ' This is a Text2', comment_counter: 3,
                            like_counter: 3, AuthorId: @user1.id)
      @post3 = Post.create!(Title: 'This is a post title3', Text: ' This is a Text2', comment_counter: 3,
                            like_counter: 3, AuthorId: @user1.id)
      @post4 = Post.create!(Title: 'This is a post title4', Text: ' This is a Text4', comment_counter: 3,
                            like_counter: 3, AuthorId: @user1.id)
      @post5 = Post.create!(Title: 'This is a post title5', Text: ' This is a Text5', comment_counter: 3,
                            like_counter: 3, AuthorId: @user1.id)

      visit user_path(@user1.id)
    end

    it 'displays the user name' do
      expect(page).to have_content(@user1.Name)
    end

    it 'displays the user photo' do
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the user bio' do
      expect(page).to have_content(@user1.Bio)
    end

    it 'displays the user posts counter' do
      expect(page).to have_content(@user1.post_counter)
    end

    it 'displays the user first 3 posts' do
      expect(page).to have_content(@post5.Title)
      expect(page).to have_content(@post4.Title)
      expect(page).to have_content(@post3.Title)
    end

    it 'displays button to see all posts' do
      expect(page).to have_link('See all posts')
    end

    it 'click a user post and redirects to post show page' do
      click_link @post4.Title
      expect(page).to have_current_path user_post_path(@user1, @post4)
    end

    it 'click see all posts and redirects to user posts index page' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
