class ChartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @budgetbooks = Budgetbook.where(user: current_user).order(created_at: :desc)
    @budgetbooks_data = @budgetbooks.map do |budgetbook|
      {
        budgetbook: budgetbook,
        expenses_by_category: {
          "食費" => budgetbook.food_expenses,
          "住居費" => budgetbook.housing_expense,
          "水道光熱費" => budgetbook.utility_bills,
          "家具・家事用品" => budgetbook.furniture_cost,
          "被服・履物" => budgetbook.clothing_expenses,
          "医療費" => budgetbook.medical_expenses,
          "交通費" => budgetbook.transportation_expenses,
          "通信費" => budgetbook.communication_expenses,
          "教育費" => budgetbook.education_cost,
          "教養娯楽費" => budgetbook.educational_and_entertainment_expenses,
          "交際費" => budgetbook.entertainment_expenses,
          "貯金" => budgetbook.savings,
          "投資" => budgetbook.investments,
          "その他" => budgetbook.others,
        },
      }
    end
  end
end
