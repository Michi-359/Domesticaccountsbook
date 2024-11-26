require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "#トップページ" do
    it "トップページにアクセスできていること" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
