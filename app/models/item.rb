class Item < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	has_one :user
	has_one :cart
	has_one :backyard
	has_many :thumbnails ,dependent: :destroy
	accepts_nested_attributes_for :thumbnails
	accepts_nested_attributes_for :backyard
	validates :name,presence: true
	validates :description, presence: true
	validates :price, presence: true ,numericality: :only_integer
	scope :get_by_price, -> (price){
		where(price: price..price + 999)
	}

end
