require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  before :each do
    create_list(:user, 3)
    visit users_path
  end

  scenario 'see all users with their details' do
    users = User.all

    users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src$='path_to_default_profile_pic.jpg']")
      expect(page).to have_content("#{user.posts.count} posts")
    end
  end

  scenario 'clicking a user redirects to their show page' do
    first_user_link = page.find('a', match: :first)
    first_user = User.find_by(name: first_user_link.text)

    first_user_link.click

    expect(page).to have_current_path(user_path(first_user), ignore_query: true)
  end
end
