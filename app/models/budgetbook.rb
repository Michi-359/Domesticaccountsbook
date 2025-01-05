class Budgetbook < ApplicationRecord
  belongs_to :user
  validates :year, presence: true
  validates :month, presence: true
  validates :household_size, presence: true
  validates :housing_type, presence: true
  validates :annual_income, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :monthly_income, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :food_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :housing_expense, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :utility_bills, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :furniture_cost, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :clothing_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :medical_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :transportation_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :communication_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :education_cost, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :educational_and_entertainment_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :entertainment_expenses, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :savings, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :investments, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }
  validates :others, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
  }

  def income_band
    case annual_income
    when nil
      '無回答'
    when 0..1749999
      '175万未満'
    when 1750000..2389999
      '239万未満'
    when 2390000..3009999
      '301万未満'
    when 3010000..3609999
      '361万未満'
    when 3610000..4299999
      '430万未満'
    when 4300000..5119999
      '512万未満'
    when 5120000..6139999
      '614万未満'
    when 6140000..7529999
      '753万未満'
    when 7530000..9569999
      '956万未満'
    else
      '956万以上'
    end
  end

  def average_expenses
    AVERAGE_EXPENSES[income_band]
  end
  AVERAGE_EXPENSES = {
    '無回答' => {
      'Furnitures' => 9815,
      'Medical' => 11956,
      'Transportation' => 24794,
      'Educational_And_Entertainment' => 24996,
      'Entertainment' => 15829,
    }.freeze,
    '175万未満' => {
      'Furnitures' => 4259,
      'Medical' => 5716,
      'Transportation' => 8298,
      'Educational_And_Entertainment' => 10422,
      'Entertainment' => 8976,
    }.freeze,
    '239万未満' => {
      'Furnitures' => 6505,
      'Medical' => 8534,
      'Transportation' => 11816,
      'Educational_And_Entertainment' => 15237,
      'Entertainment' => 13400,
    }.freeze,
    '301万未満' => {
      'Furnitures' => 7033,
      'Medical' => 9822,
      'Transportation' => 13326,
      'Educational_And_Entertainment' => 17878,
      'Entertainment' => 15101,
    }.freeze,
    '361万未満' => {
      'Furnitures' => 8879,
      'Medical' => 12471,
      'Transportation' => 18245,
      'Educational_And_Entertainment' => 19895,
      'Entertainment' => 15288,
    }.freeze,
    '430万未満' => {
      'Furnitures' => 8177,
      'Medical' => 11853,
      'Transportation' => 20866,
      'Educational_And_Entertainment' => 23938,
      'Entertainment' => 16023,
    }.freeze,
    '512万未満' => {
      'Furnitures' => 9565,
      'Medical' => 12169,
      'Transportation' => 22907,
      'Educational_And_Entertainment' => 25479,
      'Entertainment' => 16581,
    }.freeze,
    '614万未満' => {
      'Furnitures' => 10337,
      'Medical' => 11324,
      'Transportation' => 30002,
      'Educational_And_Entertainment' => 26468,
      'Entertainment' => 14666,
    }.freeze,
    '753万未満' => {
      'Furnitures' => 11972,
      'Medical' => 14634,
      'Transportation' => 33148,
      'Educational_And_Entertainment' => 28492,
      'Entertainment' => 15947,
    }.freeze,
    '956万未満' => {
      'Furnitures' => 14990,
      'Medical' => 14802,
      'Transportation' => 38824,
      'Educational_And_Entertainment' => 34963,
      'Entertainment' => 17517,
    }.freeze,
    '956万以上' => {
      'Furnitures' => 16435,
      'Medical' => 18240,
      'Transportation' => 50511,
      'Educational_And_Entertainment' => 47185,
      'Entertainment' => 24789,
    }.freeze,
  }.freeze

  def householdsize
    HOUSEHOLDSIZE[household_size]
  end
  HOUSEHOLDSIZE = {
    '1人' => {
      'Food' => 42049,
      'Utilities' => 13045,
      'Clothings' => 4447,
      'Communication' => 6610,
      'Education' => 2,
    }.freeze,
    '2人' => {
      'Food' => 72399,
      'Utilities' => 21619,
      'Clothings' => 7190,
      'Communication' => 10430,
      'Education' => 368,
    }.freeze,
    '3人' => {
      'Food' => 85557,
      'Utilities' => 25082,
      'Clothings' => 9705,
      'Communication' => 13058,
      'Education' => 11199,
    }.freeze,
    '4人' => {
      'Food' => 90712,
      'Utilities' => 25655,
      'Clothings' => 12592,
      'Communication' => 14053,
      'Education' => 26979,
    }.freeze,
    '5人' => {
      'Food' => 101806,
      'Utilities' => 27100,
      'Clothings' => 12579,
      'Communication' => 15168,
      'Education' => 30339,
    }.freeze,
    '6人以上' => {
      'Food' => 110532,
      'Utilities' => 35360,
      'Clothings' => 12919,
      'Communication' => 16543,
      'Education' => 22768,
    }.freeze,
    '無回答' => {
      'Food' => 67078,
      'Utilities' => 19867,
      'Clothings' => 7505,
      'Communication' => 10133,
      'Education' => 6588,
    }.freeze,
  }.freeze

  def housingtype
    HOUSINGTYPE[housing_type]
  end
  HOUSINGTYPE = {
    '持ち家' => {
      'House' => 10401,
    }.freeze,
    '賃貸住宅(民間)' => {
      'House' => 57601,
    }.freeze,
    '県営、市営住宅等(公営借家)' => {
      'House' => 46571,
    }.freeze,
    '社宅、公務員住宅等(給与住宅)' => {
      'House' => 18842,
    }.freeze,
    '無回答' => {
      'House' => 20141,
    }.freeze,
  }.freeze

  def total_expenses
    fields = [
      :food_expenses, :housing_expense, :utility_bills, :furniture_cost,
      :clothing_expenses, :medical_expenses, :transportation_expenses,
      :communication_expenses, :education_cost,
      :educational_and_entertainment_expenses, :entertainment_expenses,
      :savings, :investments, :others,
    ]

    fields.sum { |field| send(field) || 0 }
  end

  def savings_and_investments
    fields = [
      :savings, :investments,
    ]

    fields.sum { |field| send(field) || 0 }
  end

  def savings_rate
    if total_expenses > 0
      percentage = (savings_and_investments.to_f / total_expenses.to_f) * 100
      format('%.2f%%', percentage)
    else
      "計算不能"
    end
  end
end
