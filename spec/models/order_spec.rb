require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context '正常にデータが揃っている場合' do
    let(:order) { build(:order) }
    it 'バリデーションに通過する' do
      expect(order).to be_valid
    end
  end
  context '合計金額が0円' do
  	let(:order) { build(:order, total_fee: 0)}
  	it 'バリデーションに失敗する' do
  		expect(order).to be_invalid
  	end
  end
end