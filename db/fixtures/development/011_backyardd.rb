100.times do |i|
	Backyard.seed(:id) do |backyard|
		backyard.id = i + 1
		backyard.stock = rand(1..30)
		backyard.item_id = i + 1
	end
end
