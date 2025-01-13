require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  describe "投稿の新規作成" do
    it "投稿の新規作成ができること" do
      visit new_post_path
      select "食費", from: "post_category"
      fill_in "本文", with: "MyString"
      click_button "新規投稿"
      expect(page).to have_current_path(posts_path)
      expect(page).to have_content("投稿が追加されました。")
    end
  end

  describe "投稿の編集" do
    it "投稿の編集ができること" do
      visit edit_post_path(post.id)
      select "水道光熱費", from: "post_category"
      fill_in "本文", with: "EditString"
      click_button "編集完了"
      post.reload
      expect(post.category).to eq("水道光熱費")
      expect(post.body).to eq("EditString")
      expect(page).to have_content("投稿内容を編集しました。")
    end
  end

  describe "投稿詳細ページ" do
    it "投稿の詳細情報が表示されていること" do
      visit post_path(post)
      expect(page).to have_content post.category
      expect(page).to have_content post.body
    end
  end

  describe "投稿の削除" do
    it "投稿の削除ができること" do
      visit mypost_posts_path
      expect(page).to have_link("削除")
      click_link "削除"
      expect(page).to have_current_path(mypost_posts_path)
      expect(page).to have_content("投稿を削除しました。")
    end
  end
end
