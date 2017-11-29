200.times do |i|
	Item.seed(:id) do |item|
		item.id = i + 1
		item.name = "#{i + 1}個目の商品名"
		item.description = "#{i + 1}番目の商品説明"
		item.price = [1000, 2000, 3000, 4000,].sample
		item.user_id = rand(1..3)
	end
end