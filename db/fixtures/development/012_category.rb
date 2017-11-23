100.times do |i|
	Category.seed(:id) do |category|
		category.id = i + 1
		category.item_id = i + 1
		category.color = rand(1..2)
		category.area = [10,20,30,40,50,60,70,80].sample
	end
end