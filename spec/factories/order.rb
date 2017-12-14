FactoryBot.define do
  factory :order do
  	user_id 1
  	total_fee 5000
  	order_date Date.today
  end
end