require 'rails_helper'

RSpec.describe 'UsersIndex', type: :feature do
  describe 'user index test' do
    before(:each) do
      @user = User.create!(Name: 'User', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                           Bio: 'I am a user')
      @user2 = User.create!(Name: 'User2', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user3 = User.create!(Name: 'User3', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user4 = User.create!(Name: 'User4', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
      @user5 = User.create!(Name: 'User5', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', post_counter: 3,
                            Bio: 'I am a user')
    end

    it 'Shows the username of each user' do
      visit users_path
      expect(page).to have_content(@user.Name)
      expect(page).to have_content(@user2.Name)
      expect(page).to have_content(@user3.Name)
      expect(page).to have_content(@user4.Name)
      expect(page).to have_content(@user5.Name)
    end

    it 'Shows the number of posts each user has' do
      visit users_path
      expect(page).to have_content(@user.post_counter)
      expect(page).to have_content(@user2.post_counter)
      expect(page).to have_content(@user3.post_counter)
      expect(page).to have_content(@user4.post_counter)
      expect(page).to have_content(@user5.post_counter)
    end

    it 'Shows the photo of each user' do
      visit users_path
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
      expect(page).to have_css("img[
        src='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'Shows the link to each user' do
      visit users_path
      expect(page).to have_link(@user.Name, href: user_path(@user))
      expect(page).to have_link(@user2.Name, href: user_path(@user2))
      expect(page).to have_link(@user3.Name, href: user_path(@user3))
      expect(page).to have_link(@user4.Name, href: user_path(@user4))
      expect(page).to have_link(@user5.Name, href: user_path(@user5))
    end
  end
end
