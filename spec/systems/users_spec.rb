require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:rack_test)
  end

  describe "新規登録" do
    it "新規登録できること" do
      visit new_user_registration_path
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "ニックネーム", with: "test_user"
      fill_in "パスワード", with: "password"
      fill_in "パスワード(確認)", with: "password"
      click_button "新規登録"
      expect(page).to have_current_path(root_path)
      expect(page).to have_content("アカウント登録が完了しました。")
    end
  end

  describe "アカウント情報編集" do
    it "アカウント情報の編集ができること" do
      sign_in user
      visit edit_user_registration_path
      fill_in "メールアドレス", with: "edit@example.com"
      fill_in "ニックネーム", with: "edit_user"
      fill_in "パスワード", with: "editpassword"
      fill_in "パスワード(確認)", with: "editpassword"
      fill_in "現在のパスワード", with: "password"
      click_button "更新"
      expect(user.reload.email).to eq("edit@example.com")
      expect(user.reload.name).to eq("edit_user")
      expect(page).to have_content("アカウント情報を変更しました。")
    end
  end

  describe "ゲストログイン" do
    it "ゲストログインができること" do
      visit root_path
      click_on "ゲストログイン"
      expect(page).to have_current_path(root_path)
      expect(page).to have_content("ゲストユーザーとしてログインしました。")
    end
  end

  describe "アカウント削除" do
    it "アカウント削除ができること" do
      sign_in user
      visit edit_user_registration_path
      expect(page).to have_button("アカウント削除")
      click_button "アカウント削除"
      expect(page).to have_current_path(root_path)
      expect(page).to have_content("アカウントを削除しました。またのご利用をお待ちしております。")
    end
  end
end
