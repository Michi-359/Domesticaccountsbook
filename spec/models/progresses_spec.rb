require 'rails_helper'

RSpec.describe "Progresses", type: :model do
  let(:user) { create(:user) }
  let!(:progress) { create(:progress, user: user) }

  describe "目標貯金額" do
    it "目標貯金額が空では登録できないこと" do
      progress.target_amount = ""
      progress.valid?
      expect(progress.errors[:target_amount]).to include("目標貯金額を入力してください。")
    end

    it "目標貯金額が0では登録できないこと" do
      progress.target_amount = 0
      progress.valid?
      expect(progress.errors[:target_amount]).to include("目標貯金額は1円以上1億円以下で入力してください。")
    end
  end

  describe "今まで貯めた金額" do
    it "今まで貯めた金額を正しく算出できること" do
      expect(progress.total_savings).to eq(43000)
    end
  end

  describe "目標貯金額と今まで貯めた金額の差" do
    it "目標貯金額と今まで貯めた金額の差を正しく算出できること" do
      expect(progress.distance_to_target_amount).to eq(57000)
    end
  end

  describe "目標貯金額の達成割合" do
    it "目標貯金額の達成割合を正しく算出できること" do
      expect(progress.progress_percentage).to eq(43)
    end
  end

  describe "目標貯金額の達成割合が100に達しているかどうかの判別" do
    it "目標貯金額の達成割合が100に達しているかどうかを正しく判別できること" do
      expect(progress.achieving_purpose?).to be false
    end

    it "目標貯金額の達成割合が100に達していることを判別できること" do
      progress.update(
        months: 18,
        special_reserve: 10000
      )
      expect(progress.achieving_purpose?).to be true
    end
  end
end
