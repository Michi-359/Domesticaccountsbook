require 'rails_helper'

RSpec.describe "Progresses", type: :system do
  let(:user) { create(:user) }
  let!(:progress) { create(:progress, user: user) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  describe "目標貯金額の新規作成" do
    it "目標貯金額の新規作成ができること" do
      visit new_progress_path
      fill_in "貯金の目的", with: "旅費"
      fill_in "毎月貯める金額", with: "5000"
      fill_in "貯めた月数", with: "7"
      fill_in "毎月貯める金額の他に追加した金額", with: "8000"
      fill_in "目標貯金額", with: "100000"
      click_button "新規作成"
      expect(page).to have_current_path(progresses_path)
      expect(page).to have_content("目標貯金額の作成が完了しました。")
    end
  end

  describe "目標の編集" do
    it "目標の編集ができること" do
      visit edit_progress_path(progress.id)
      fill_in "貯金の目的", with: "旅費に使います"
      fill_in "貯めた月数", with: "8"
      fill_in "毎月貯める金額の他に追加した金額", with: "10000"
      click_button "編集完了"
      expect(progress.reload.purpose_of_saving).to eq("旅費に使います")
      expect(progress.months).to eq(8)
      expect(progress.special_reserve).to eq(10000)
      expect(page).to have_content("目標貯金額の編集が完了しました。")
    end
  end

  describe "投稿の削除" do
    it "投稿の削除ができること" do
      visit progresses_path
      expect(page).to have_link("削除")
      click_link "削除"
      expect(page).to have_current_path(progresses_path)
      expect(page).to have_content("目標貯金額を削除しました。")
    end
  end
end
