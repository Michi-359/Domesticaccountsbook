require 'rails_helper'

RSpec.describe "Budgetbooks", type: :system, js: false do
  let(:user) { create(:user) }
  let!(:budgetbook) { create(:budgetbook, user: user) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  describe "家計簿の新規作成" do
    it "家計簿の新規作成ができること" do
      visit new_budgetbook_path
      select "2024", from: "budgetbook_year"
      select "10", from: "budgetbook_month"
      select "1人", from: "budgetbook_household_size"
      select "賃貸住宅(民間)", from: "budgetbook_housing_type"
      fill_in "年収", with: "3000000"
      fill_in "月収", with: "250000"
      fill_in "食費", with: "40000"
      fill_in "住居費", with: "60000"
      fill_in "水道光熱費", with: "15000"
      fill_in "家具・家事用品費", with: "5000"
      fill_in "被服・履物費", with: "5000"
      fill_in "医療費", with: "5000"
      fill_in "交通費", with: "10000"
      fill_in "通信費", with: "10000"
      fill_in "教育費", with: "20000"
      fill_in "教養娯楽費", with: "15000"
      fill_in "交際費", with: "30000"
      fill_in "貯金額", with: "12000"
      fill_in "投資額", with: "5000"
      fill_in "その他の支出", with: "18000"
      click_button "新規作成"
      expect(page).to have_current_path(budgetbooks_path)
      expect(page).to have_content("家計簿が追加されました。")
    end
  end

  describe "家計簿の編集" do
    it "家計簿の編集ができること" do
      visit edit_budgetbook_path(budgetbook.id)
      select "2025", from: "budgetbook_year"
      select "1", from: "budgetbook_month"
      select "2人", from: "budgetbook_household_size"
      select "持ち家", from: "budgetbook_housing_type"
      fill_in "年収", with: "4000000"
      click_button "更新"
      budgetbook.reload
      expect(budgetbook.year).to eq(2025)
      expect(budgetbook.month).to eq(1)
      expect(budgetbook.household_size).to eq("2人")
      expect(budgetbook.housing_type).to eq("持ち家")
      expect(budgetbook.annual_income).to eq(4000000)
      expect(page).to have_content("家計簿が更新されました。")
    end
  end

  describe "家計簿の削除" do
    it "家計簿の削除ができること" do
      visit budgetbooks_path
      expect(page).to have_link("削除")
      click_link "削除"
      expect(page).to have_current_path(budgetbooks_path)
      expect(page).to have_content("家計簿を削除しました。")
    end
  end
end
