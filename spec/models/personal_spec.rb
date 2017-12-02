require 'rails_helper'

RSpec.describe Personal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
	context '正常にデータが揃っている場合' do
		let(:personal) { build(:personal)}
		it 'バリデーションに通過する' do
			expect(personal).to be_valid
		end
	end

end
