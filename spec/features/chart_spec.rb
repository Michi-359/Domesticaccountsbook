require 'rails_helper'

RSpec.describe '家計簿のグラフ', type: :feature, js: true do
  let(:user) { create(:user) }
  let!(:budgetbook) { create(:budgetbook, user: user) }

  before do
    sign_in user
    visit charts_path
  end

  it '家計簿のグラフが読み込まれているか' do
    expect(page.evaluate_script('typeof Chartkick')).to eq('object')
  end
end
