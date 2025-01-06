require 'rails_helper'

RSpec.describe "Budgetbooks", type: :model do
  let(:user) { create(:user) }
  let!(:budgetbook) { create(:budgetbook, user: user) }

  describe "支出の合計" do
    it "支出の合計額を正しく算出できること" do
      expect(budgetbook.total_expenses).to eq(250000)
    end
  end

  describe "貯蓄額" do
    it "貯蓄額を正しく算出できること" do
      expect(budgetbook.savings_and_investments).to eq(17000)
    end
  end

  describe "貯蓄率" do
    it "貯蓄率を正しく算出できること" do
      expect(budgetbook.savings_rate).to eq("6.80%")
    end

    it "支出の合計が0の場合、計算不能という文字を返すこと" do
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
      expect(budgetbook.savings_rate).to eq('計算不能')
    end
  end

  describe '年収別の平均支出' do
    it '年収に応じて平均支出を呼び出せること' do
      budgetbook.annual_income = nil
      expect(budgetbook.income_band).to eq('無回答')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 9815,
        'Medical' => 11956,
        'Transportation' => 24794,
        'Educational_And_Entertainment' => 24996,
        'Entertainment' => 15829,
      })

      budgetbook.annual_income = 1740000
      expect(budgetbook.income_band).to eq('175万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 4259,
        'Medical' => 5716,
        'Transportation' => 8298,
        'Educational_And_Entertainment' => 10422,
        'Entertainment' => 8976,
      })

      budgetbook.annual_income = 2380000
      expect(budgetbook.income_band).to eq('239万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 6505,
        'Medical' => 8534,
        'Transportation' => 11816,
        'Educational_And_Entertainment' => 15237,
        'Entertainment' => 13400,
      })

      budgetbook.annual_income = 3000000
      expect(budgetbook.income_band).to eq('301万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 7033,
        'Medical' => 9822,
        'Transportation' => 13326,
        'Educational_And_Entertainment' => 17878,
        'Entertainment' => 15101,
      })

      budgetbook.annual_income = 3600000
      expect(budgetbook.income_band).to eq('361万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 8879,
        'Medical' => 12471,
        'Transportation' => 18245,
        'Educational_And_Entertainment' => 19895,
        'Entertainment' => 15288,
      })

      budgetbook.annual_income = 4290000
      expect(budgetbook.income_band).to eq('430万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 8177,
        'Medical' => 11853,
        'Transportation' => 20866,
        'Educational_And_Entertainment' => 23938,
        'Entertainment' => 16023,
      })

      budgetbook.annual_income = 5110000
      expect(budgetbook.income_band).to eq('512万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 9565,
        'Medical' => 12169,
        'Transportation' => 22907,
        'Educational_And_Entertainment' => 25479,
        'Entertainment' => 16581,
      })

      budgetbook.annual_income = 6130000
      expect(budgetbook.income_band).to eq('614万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 10337,
        'Medical' => 11324,
        'Transportation' => 30002,
        'Educational_And_Entertainment' => 26468,
        'Entertainment' => 14666,
      })

      budgetbook.annual_income = 7520000
      expect(budgetbook.income_band).to eq('753万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 11972,
        'Medical' => 14634,
        'Transportation' => 33148,
        'Educational_And_Entertainment' => 28492,
        'Entertainment' => 15947,
      })

      budgetbook.annual_income = 9550000
      expect(budgetbook.income_band).to eq('956万未満')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 14990,
        'Medical' => 14802,
        'Transportation' => 38824,
        'Educational_And_Entertainment' => 34963,
        'Entertainment' => 17517,
      })

      budgetbook.annual_income = 9560000
      expect(budgetbook.income_band).to eq('956万以上')
      expect(budgetbook.average_expenses).to eq({
        'Furnitures' => 16435,
        'Medical' => 18240,
        'Transportation' => 50511,
        'Educational_And_Entertainment' => 47185,
        'Entertainment' => 24789,
      })
    end
  end

  describe '世帯人数別の平均支出' do
    it '世帯人数に応じて平均支出を呼び出せること' do
      budgetbook.household_size = '1人'
      expect(budgetbook.householdsize).to eq({
        'Food' => 42049,
        'Utilities' => 13045,
        'Clothings' => 4447,
        'Communication' => 6610,
        'Education' => 2,
      })

      budgetbook.household_size = '2人'
      expect(budgetbook.householdsize).to eq({
        'Food' => 72399,
        'Utilities' => 21619,
        'Clothings' => 7190,
        'Communication' => 10430,
        'Education' => 368,
      })

      budgetbook.household_size = '3人'
      expect(budgetbook.householdsize).to eq({
        'Food' => 85557,
        'Utilities' => 25082,
        'Clothings' => 9705,
        'Communication' => 13058,
        'Education' => 11199,
      })

      budgetbook.household_size = '4人'
      expect(budgetbook.householdsize).to eq({
        'Food' => 90712,
        'Utilities' => 25655,
        'Clothings' => 12592,
        'Communication' => 14053,
        'Education' => 26979,
      })

      budgetbook.household_size = '5人'
      expect(budgetbook.householdsize).to eq({
        'Food' => 101806,
        'Utilities' => 27100,
        'Clothings' => 12579,
        'Communication' => 15168,
        'Education' => 30339,
      })

      budgetbook.household_size = '6人以上'
      expect(budgetbook.householdsize).to eq({
        'Food' => 110532,
        'Utilities' => 35360,
        'Clothings' => 12919,
        'Communication' => 16543,
        'Education' => 22768,
      })

      budgetbook.household_size = '無回答'
      expect(budgetbook.householdsize).to eq({
        'Food' => 67078,
        'Utilities' => 19867,
        'Clothings' => 7505,
        'Communication' => 10133,
        'Education' => 6588,
      })
    end
  end

  describe '住居形態' do
    it '住居形態に応じて平均支出を呼び出せること' do
      budgetbook.housing_type = '持ち家'
      expect(budgetbook.housingtype).to eq({
        'House' => 10401
      })

      budgetbook.housing_type = '賃貸住宅(民間)'
      expect(budgetbook.housingtype).to eq({
        'House' => 57601
      })

      budgetbook.housing_type = '県営、市営住宅等(公営借家)'
      expect(budgetbook.housingtype).to eq({
        'House' => 46571
      })

      budgetbook.housing_type = '社宅、公務員住宅等(給与住宅)'
      expect(budgetbook.housingtype).to eq({
        'House' => 18842
      })

      budgetbook.housing_type = '無回答'
      expect(budgetbook.housingtype).to eq({
        'House' => 20141
      })
    end
  end
end
