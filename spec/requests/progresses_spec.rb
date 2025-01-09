require 'rails_helper'

RSpec.describe "Progresses", type: :request do
  include ActionView::Helpers::NumberHelper
  let(:user) { create(:user) }
  let!(:progress) { create(:progress, user: user) }

  describe "目標貯金額一覧" do
    before do
      sign_in user
      get progresses_path
    end

    it "目標貯金額一覧にアクセスできていること" do
      expect(response).to have_http_status(:ok)
    end

    it "貯金の目的が取得されていること" do
      expect(response.body).to include(progress.purpose_of_saving)
    end

    it "毎月貯める金額が取得されていること" do
      formatted_monthly_savings = number_to_currency(progress.monthly_savings, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_monthly_savings)
    end

    it "貯めた月数が取得されていること" do
      expect(response.body).to include(progress.months.to_s)
    end

    it "毎月貯める金額の他に追加した金額が取得されていること" do
      formatted_special_reserve = number_to_currency(progress.special_reserve, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_special_reserve)
    end

    it "目標貯金額が取得されていること" do
      formatted_target_amount = number_to_currency(progress.target_amount, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_target_amount)
    end

    it "今まで貯めた金額が取得されていること" do
      formatted_total_savings = number_to_currency(progress.total_savings, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_total_savings)
    end

    it "目標貯金額と今まで貯めた金額の差が取得されていること" do
      formatted_distance_to_target_amount = number_to_currency(progress.distance_to_target_amount, :format => "%u%n", :unit => "￥", strip_insignificant_zeros: true)
      expect(response.body).to include(formatted_distance_to_target_amount)
    end

    it "目標貯金額の達成割合が取得されていること" do
      expect(response.body).to include(progress.progress_percentage.to_s)
    end
  end
end
