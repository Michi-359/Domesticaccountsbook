require 'rails_helper'

RSpec.describe "Budgetbooks", type: :request do
  include ActionView::Helpers::NumberHelper
  let(:user) { create(:user) }
  let!(:budgetbook) { create(:budgetbook, user: user) }

  describe "家計簿一覧" do
    before do
      sign_in user
      get budgetbooks_path
    end

    it "家計簿一覧にアクセスできていること" do
      expect(response).to have_http_status(:ok)
    end

    it "年が取得されていること" do
      expect(response.body).to include(budgetbook.year.to_s)
    end

    it "月が取得されていること" do
      expect(response.body).to include(budgetbook.month.to_s)
    end

    it "世帯人数が取得されていること" do
      expect(response.body).to include(budgetbook.household_size)
    end

    it "住居形態が取得されていること" do
      expect(response.body).to include(budgetbook.housing_type)
    end

    it "年収が取得されていること" do
      formatted_annual_income = number_to_currency(budgetbook.annual_income, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_annual_income)
    end

    it "月収が取得されていること" do
      formatted_monthly_income = number_to_currency(budgetbook.monthly_income, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_monthly_income)
    end

    it "食費が取得されていること" do
      formatted_food_expenses = number_to_currency(budgetbook.food_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_food_expenses)
    end

    it "住居費が取得されていること" do
      formatted_housing_expense = number_to_currency(budgetbook.housing_expense, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_housing_expense)
    end

    it "水道光熱費が取得されていること" do
      formatted_utility_bills = number_to_currency(budgetbook.utility_bills, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_utility_bills)
    end

    it "家具・家事用品費が取得されていること" do
      formatted_furniture_cost = number_to_currency(budgetbook.furniture_cost, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_furniture_cost)
    end

    it "被服・履物費が取得されていること" do
      formatted_clothing_expenses = number_to_currency(budgetbook.clothing_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_clothing_expenses)
    end

    it "医療費が取得されていること" do
      formatted_medical_expenses = number_to_currency(budgetbook.medical_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_medical_expenses)
    end

    it "交通費が取得されていること" do
      formatted_transportation_expenses = number_to_currency(budgetbook.transportation_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_transportation_expenses)
    end

    it "通信費が取得されていること" do
      formatted_communication_expenses = number_to_currency(budgetbook.communication_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_communication_expenses)
    end

    it "教育費が取得されていること" do
      formatted_education_cost = number_to_currency(budgetbook.education_cost, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_education_cost)
    end

    it "教養娯楽費が取得されていること" do
      formatted_educational_and_entertainment_expenses = number_to_currency(budgetbook.educational_and_entertainment_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_educational_and_entertainment_expenses)
    end

    it "交際費が取得されていること" do
      formatted_entertainment_expenses = number_to_currency(budgetbook.entertainment_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_entertainment_expenses)
    end

    it "貯金額が取得されていること" do
      formatted_savings = number_to_currency(budgetbook.savings, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_savings)
    end

    it "投資額が取得されていること" do
      formatted_investments = number_to_currency(budgetbook.investments, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_investments)
    end

    it "その他の支出が取得されていること" do
      formatted_others = number_to_currency(budgetbook.others, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_others)
    end

    it "支出の合計が取得されていること" do
      formatted_total_expenses = number_to_currency(budgetbook.total_expenses, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_total_expenses)
    end

    it "貯蓄額が取得されていること" do
      formatted_savings_and_investments = number_to_currency(budgetbook.savings_and_investments, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_savings_and_investments)
    end

    it "貯蓄率が取得されていること" do
      expect(response.body).to include(budgetbook.savings_rate)
    end

    it "支出の合計が0の場合、貯蓄率の項目では計算不能という文が取得されること" do
      budgetbook.update(
        food_expenses: 0,
        housing_expense: 0,
        utility_bills: 0,
        furniture_cost: 0,
        clothing_expenses: 0,
        medical_expenses: 0,
        transportation_expenses: 0,
        communication_expenses: 0,
        education_cost: 0,
        educational_and_entertainment_expenses: 0,
        entertainment_expenses: 0,
        savings: 0,
        investments: 0,
        others: 0
      )

      get budgetbooks_path
      expect(response.body).to include("計算不能")
    end

    it "食費の平均支出が取得されていること" do
      formatted_householdsize_food_expenses = number_to_currency(budgetbook.householdsize['Food'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_householdsize_food_expenses)
    end

    it "住居費の平均支出が取得されていること" do
      formatted_housingtype_housing_expense = number_to_currency(budgetbook.housingtype['House'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_housingtype_housing_expense)
    end

    it "水道光熱費の平均支出が取得されていること" do
      formatted_householdsize_utility_bills = number_to_currency(budgetbook.householdsize['Utilities'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_householdsize_utility_bills)
    end

    it "家具・家事用品費の平均支出が取得されていること" do
      formatted_average_expenses_furniture_cost = number_to_currency(budgetbook.average_expenses['Furnitures'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_average_expenses_furniture_cost)
    end

    it "被服・履物費の平均支出が取得されていること" do
      formatted_householdsize_clothings = number_to_currency(budgetbook.householdsize['Clothings'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_householdsize_clothings)
    end

    it "医療費の平均支出が取得されていること" do
      formatted_average_expenses_medical_expenses = number_to_currency(budgetbook.average_expenses['Medical'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_average_expenses_medical_expenses)
    end

    it "交通費の平均支出が取得されていること" do
      formatted_average_expenses_transportation_expenses = number_to_currency(budgetbook.average_expenses['Transportation'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_average_expenses_transportation_expenses)
    end

    it "通信費の平均支出が取得されていること" do
      formatted_householdsize_communication_expenses = number_to_currency(budgetbook.householdsize['Communication'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_householdsize_communication_expenses)
    end

    it "教育費の平均支出が取得されていること" do
      formatted_householdsize_education_cost = number_to_currency(budgetbook.householdsize['Education'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_householdsize_education_cost)
    end

    it "教養娯楽費の平均支出が取得されていること" do
      formatted_average_expenses_educational_and_entertainment_expenses = number_to_currency(budgetbook.average_expenses['Educational_And_Entertainment'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_average_expenses_educational_and_entertainment_expenses)
    end

    it "交際費の平均支出が取得されていること" do
      formatted_average_expenses_entertainment_expenses = number_to_currency(budgetbook.average_expenses['Entertainment'], :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_average_expenses_entertainment_expenses)
    end
  end
end
