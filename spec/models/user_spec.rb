require 'rails_helper'

RSpec.describe "Users", type: :model do
  let(:user) { create(:user) }

  describe "ユーザー登録" do
    it "ユーザー登録できること" do
      expect(user).to be_valid
    end

    it "emailが空では登録できないこと" do
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it "同じメールアドレスを登録できないこと" do
      user1 = create(:user)
      user.email = user1.email
      user.valid?
      expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it "nameが空では登録できないこと" do
      user.name = ""
      user.valid?
      expect(user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "nameが31文字以上では登録できないこと" do
      user.name = "1234567890123456789012345678901"
      user.valid?
      expect(user.errors.full_messages).to include("ニックネームは30文字以内で入力してください")
    end

    it "passwordとpassword_confirmationが一致しないと登録できないこと" do
      user.password = "password"
      user.password_confirmation = "password2"
      user.valid?
      expect(user.errors.full_messages).to include("パスワード(確認)とパスワードの入力が一致しません")
    end

    it "passwordとpassword_confirmationが空では登録できないこと" do
      user.password = ""
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordとpassword_confirmationが文字数5文字以下では登録できないこと" do
      user.password = "12345"
      user.password_confirmation = "12345"
      user.valid?
      expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordとpassword_confirmationが文字数31文字以上では登録できないこと" do
      user.password = "1234567890123456789012345678901"
      user.password_confirmation = "1234567890123456789012345678901"
      user.valid?
      expect(user.errors.full_messages).to include("パスワードは30文字以内で入力してください")
    end
  end

  describe "ゲストログイン" do
    it "ゲストユーザーが取得できること" do
      guest_user = User.guest
      expect(guest_user.email).to eq("guest@example.com")
    end

    it "ゲストユーザーである場合にtrueを返すこと" do
      guest_user = User.guest
      expect(guest_user.guest?).to be true
    end

    it "ゲストユーザーでない場合にfalseを返すこと" do
      wrong_guest_user = create(:user, email: "wrong_guest@example.com")
      expect(wrong_guest_user.guest?).to be false
    end
  end
end
