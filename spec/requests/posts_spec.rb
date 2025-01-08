require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  describe "投稿一覧" do
    before do
      sign_in user
      get posts_path
    end

    it "投稿一覧にアクセスできていること" do
      expect(response).to have_http_status(:ok)
    end

    it "カテゴリーが取得されていること" do
      expect(response.body).to include(post.category)
    end

    it "投稿内容が取得されていること" do
      expect(response.body).to include(post.body)
    end
  end
end
