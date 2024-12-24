require 'rails_helper'

RSpec.describe "Users", type: :model do
  describe "ユーザー登録" do
    it "ユーザー登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "emailが空では登録できないこと" do
      user = build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "同じメールアドレスを登録できないこと" do
      user = build(:user)
      user1 = create(:user)
      user.email = user1.email
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it "nameが空では登録できないこと" do
      user = build(:user)
      user.name = ""
      user.valid?
      expect(user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("パスワードを入力してください", "パスワード(確認)とパスワードの入力が一致しません")
    end

    it "passwordが文字数5文字以下では登録できないこと" do
      user = build(:user)
      user.password = "12345"
      user.valid?
      expect(user.errors.full_messages).to include("パスワード(確認)とパスワードの入力が一致しません")
    end

    it "password_confirmationが空では登録できないこと" do
      user = build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("パスワード(確認)とパスワードの入力が一致しません")
    end

    it "passwordとpassword_confirmationが一致しないと登録できないこと" do
      user = build(:user)
      user.password = "password"
      user.password_confirmation = "password2"
      user.valid?
      expect(user.errors.full_messages).to include("パスワード(確認)とパスワードの入力が一致しません")
    end

    it "password_confirmationが文字数5文字以下では登録できないこと" do
      user = build(:user)
      user.password_confirmation = "12345"
      user.valid?
      expect(user.errors.full_messages).to include("パスワード(確認)とパスワードの入力が一致しません")
    end
  end

  describe "ゲストログイン" do
    it "ゲストユーザーが取得できること" do
      guest_user = User.guest
      expect(guest_user.email).to eq("guest@example.com")
    end

    it "ゲストユーザーが取得できること" do
      guest_user = User.guest
      expect(guest_user.guest?).to be true
    end

    it "ゲストユーザーでない場合にfalseを返すこと" do
      wrong_guest_user = create(:user, email: "wrong_guest@example.com")
      expect(wrong_guest_user.guest?).to be false
    end
  end
end
