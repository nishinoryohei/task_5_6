require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

	describe 'GET#show' do
		let(:item) { create(:item) }
		it 'assigns the requested item to @item' do
			get :show, params: { id: item.id }
			expect(assigns(:item)).to eq item
		end
		it 'renders the :show templare' do
			get :show, params: { id: item.id }
			expect(response).to render_template :show
		end
		context '要求されたアイテムが存在しないこと' do
			it 'リクエストはRecordNotFoundとなること' do
				expect{
					get 'show', params:{ id: 2 }
				}.to raise_exception(ActiveRecord::RecordNotFound)
# ダメな例
# expect(project.project_users(test, test2)).to raise_error(IllegalAccessError)
# 正解
# expect{ project.project_users(test, test2) }.to raise_error(IllegalAccessError)
# raise_errorを使う場合は，ブロックで例外コードを囲わないとうまく動作しないらしい
			end
		end
	end
	describe 'GET#index' do
		let(:item) { create(:item) }
		it 'リクエストは200になること' do
			get :index
			expect(response.status).to eq 200
		end
		it 'index.htmlを表示すること' do
			get :index
			expect(response).to render_template :index
		end
	end
	describe 'GET#new' do
		let(:item) { create(:item) }
		let(:user) { User.find(2) }
		let(:exhibitor_user) { User.find(1) }
		context 'exhibitorの場合' do
			before do
			login_user exhibitor_user
			end
			it 'ユーザーはリクエストは200になること' do
				get :new
				expect(response.status).to eq 200
			end
			it '@itemに新しいアイテムを割り当てること' do
				get :new
				expect(assigns(:item)).to be_a_new(Item)
			end
		end
		context '一般userの場合' do 
			before do
			login_user user
			end
			it 'リダイレクト 302 になる' do
				get :new
				expect(response.status).to eq 302
			end
			it 'indexにリダイレクトする' do
				get :new
				expect(response).to redirect_to items_path
			end
		end
	end
	describe 'POST#create' do
		let(:user) { User.find(1) }
		before do
		login_user user	
		end
		context '有効なパラメータの場合' do
			before do
			@item = attributes_for(:item)
			# インスタンス生成に使われる属性集合を返す
			# attrs = attributes_for(:user)
			end
			it 'saveしてindexページにリダイレクトする' do
				post :create, params:{ item: @item }
				expect(response).to redirect_to items_path
			end
			it 'データベースに新しいアイテムが登録されること' do
				expect{
					post :create, params:{ item: @item }
				}.to change(Item, :count).by(1)
# expect{ X }.to change{ Y }.from(A).to(B) ＝ 「X すると Y が A から B に変わることを期待する」
# 			it 'userを削除すると、userが書いたblogも削除されること' do
#  			 user = User.create(name: 'Tom', email: 'tom@example.com')
#   			# user が blog を書いたことにする
#   		user.blogs.create(title: 'RSpec必勝法', content: 'あとで書く')
#   		expect{ user.destroy }.to change{ Blog.count }.by(-1)
# 			end
			end
		end
		context '無効なパラメータの場合' do
			before do
			@invalid_item = attributes_for(:invalid_item)
			end
			it 'newページを再表示すること' do
				post :create, params:{ item: @invalid_item }
				expect(response).to render_template :new
			end
			it 'データベースに新しいアイテムが登録されないこと' do
				expect{
					post :create, params:{ item: @invalid_item }
				}.not_to change(Item, :count)
			end
		end
	end
	describe 'PATCH#update' do
		let(:user) { User.find(1) }
		before do
		login_user user	
		end
		let(:item) { create(:item) }
		context '有効なパラメータの場合' do
			before do
				patch :update, params:{ item: attributes_for(:item, name: 'test'), id: item.id}
			end
			it 'showページへリダイレクトすること' do
		    	expect(response).to redirect_to item_path(item)
		    end
		    it 'データベースが更新されること' do
		    	item.reload
		    	expect(item.name).to eq 'test'
		    end
		end
		context '無効なパラメータの場合' do
		  	before do
		  		patch :update,params:{ 
		  			item: attributes_for(:invalid_item),
		  			id: item.id
		  		}
		  	end
		  	it 'editページを再表示すること' do
		  		expect(response).to render_template :edit
			end
			it 'データベースは更新されないこと' do
				item.reload
				expect(item).not_to eq :invalid_item
			end
		end	
	end
	describe 'DELETE#destroy' do
		let(:user) { User.find(1)}
		before do
		login_user user
		end
		let(:item) { create(:item) }
		context '存在するアイテムの場合' do
			before do
				delete :destroy, params:{ id: item.id }
			end
			it 'indexページにリダイレクトすること' do
				expect(response).to redirect_to items_path
			end
			it 'データベースから削除されること' do
				expect{
					delete :destroy,params:{ id: item.id }
				}.to raise_exception(ActiveRecord::RecordNotFound)
			end
		end
	end	
end

