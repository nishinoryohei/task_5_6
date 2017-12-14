require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe 'GET#show' do
		context 'ログイン済みユーザー' do
			let(:user) { User.find(1) }
			before do
			login_user user
			end
			it '正しいuserを呼び出せること' do
				get :show, params:{ id: user.id }
				expect(assigns(:user)).to eq user
			end
			it 'showページを正しく表示できること' do
				get :show, params: { id: user.id }
				expect(response).to render_template :show
			end
			it 'userが存在しない場合RecordNotFoundとなること' do
				expect{
					get :show, params:{ id: 100 }
				}.to raise_exception(ActiveRecord::RecordNotFound)
			end
		end
		context 'ログインしていないユーザー' do
			let(:user) { User.find(1)}
			it 'showページを表示せず、リダイレクトすること' do
				get :show, params:{ id: user.id }
				expect(response.status).to eq 302
			end
			it 'ログインページを表示する' do
				get :show, params:{ id: user.id }
				expect(response).to redirect_to new_user_session_path
			end
		end
	end
	describe 'GET#exhibitor' do
		let(:user) { User.find(2) }
		let(:exhibitor_user) { User.find(1) }
		context 'Exhibitorのユーザー' do
			before do
			login_user exhibitor_user
			end
			it 'Exhibitorのページを表示すること' do
				get :exhibitor, params:{ id: exhibitor_user.id}
				expect(response).to render_template :exhibitor
			end
		end
	end
end
