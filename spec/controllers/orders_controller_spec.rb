require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
	describe 'POST#create' do
		let(:cart) { create(:cart) }
		let(:personal) { create(:personal) }
		let(:user) { User.find(1) }
		before do
		login_user user
		end
		context '有効なパラメータの場合(personalが存在する)' do
			before do
			@order = attributes_for(:order)
			end
			it 'indexページへリダイレクトすること' do
				post :create, params:{ order: @order, user_id: user.id }
				expect(response).to redirect_to items_path
			end	
		end
	end
end
