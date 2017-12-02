require 'rails_helper'

RSpec.describe Personal, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context '正常にデータが揃っている場合' do
    let(:personal) { build(:personal) }
    it 'バリデーションに通過する' do
      expect(personal).to be_valid
    end
  end
  context 'stateがnilの場合' do
    let(:personal) { build(:personal, state: nil) }
    it 'バリデーションに失敗する' do
      expect(personal).to be_invalid
    end
  end
  context 'cityがnilの場合' do
  	let(:personal) { build(:personal, city: nil) }
  	it 'バリデーションに失敗する' do
  		expect(personal).to be_invalid
  	end
  end
  context 'addressがnilの場合' do 
  	let(:personal) { build(:personal, address: nil) }
  	it 'バリデーションに失敗する' do
  		expect(personal).to be_invalid
  	end
  end
  context 'telが正規表現以外の場合' do
  	let(:personal) { build(:personal, tel: 'aaaaaaaa') }
  	it 'バリデーションに失敗する' do
  		expect(personal).to be_invalid
    end
  end
end