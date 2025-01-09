class Progress < ApplicationRecord
  belongs_to :user
  validates :purpose_of_saving, allow_blank: true, length: { maximum: 100, message: "貯金の目的は100文字以内で入力してください" }
  validates :monthly_savings, presence: { message: "毎月貯める金額を入力してください" }, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5000000,
    message: "毎月貯める金額は1円以上500万円以下で入力してください",
  }
  validates :months, presence: { message: "貯めた月数を入力してください" }, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 240,
    message: "貯めた月数は1か月以上240か月以下で入力してください",
  }
  validates :special_reserve, allow_blank: true, numericality: {
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000,
    message: "毎月貯める金額の他に追加した金額は1億円以下で入力してください",
  }
  validates :target_amount, presence: { message: "目標貯金額を入力してください" }, numericality: {
    greater_than_or_equal_to: 1, less_than_or_equal_to: 100000000,
    message: "目標貯金額は1円以上1億円以下で入力してください",
  }
end
