require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }
  background do
    parent_category = Category.create(name: '大型犬', ancestry: nil)
    child_category = Category.create(name: 'ゴールデンレトリバー', ancestry: 9)
  end

  scenario 'ログインして新規投稿する', js: true do
    visit root_path
    expect(page).to have_no_content('新規投稿')

    visit login_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[value="ログイン"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('新規投稿')

    # expect {
    #   click_link('new-post-btn')
    #   expect(current_path).to eq new_post_path
    #   attach_file 'post_images_1', "#{Rails.root}/spec/support/assets/test-image.png", make_visible: true
    #   fill_in 'post_title', with: 'フィーチャスペックのテスト'
    #   fill_in 'post_body', with: 'フィーチャスペックのテスト'
    #   expect(page).to have_select('parent_category', options: ['---', '大型犬', '中型犬', '小型犬'])
    #   select '大型犬', from: 'parent_category'
    #   wait_for_css_appear('#child_category')
    #   wait_for_ajax
    #   select 'ゴールデンレトリバー', from: 'child_category'
    #   find('input[value="保存"]').click
    # }.to change(Post, :count).by(1)
  end
end