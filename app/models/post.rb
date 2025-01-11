class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: { message: "投稿内容は必須です。" }, length: { maximum: 200, message: "投稿内容は200文字以内で入力してください。" }
end
