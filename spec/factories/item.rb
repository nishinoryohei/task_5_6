FactoryBot.define do
  factory :item, class: Item do
	name "1個目の商品名"
	description "1番目の商品説明"
	price 1000
	user_id 1
  end

  factory :invalid_item, class: Item do
  	name 'test'
  	description 1
  	price 'test'
  	user_id 1
  end
end
# データを二種類作成する場合は　class: をつけなければいけない