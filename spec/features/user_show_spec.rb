require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { create(:user) }
  let!(:first_post) { create(:post, author: user) }

  before do
    visit user_path(user)
  end

  scenario "viewing a user's details" do
    expect(page).to have_content(user.name)
    expect(page).to have_css("img[src$='path_to_default_profile_pic.jpg']")
    expect(page).to have_content(user.bio) if user.bio
    expect(page).to have_content("#{user.posts.count} posts")
    user.posts.limit(3).each do |post|
      expect(page).to have_content(post.title)
    end
  end

  scenario 'clicking on a post redirects to post show page' do
    click_on first_post.title
    expect(page).to have_current_path(user_post_path(user, first_post), ignore_query: true)
  end

  scenario 'clicking the view all posts button' do
    expect(page).to have_link('All posts', href: user_posts_path(user))

    click_on 'All posts'
    expect(page).to have_current_path(user_posts_path(user), ignore_query: true)
  end
end
