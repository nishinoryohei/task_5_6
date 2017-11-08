class Item < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :user
	has_many :thumbnails ,dependent: :destroy
	accepts_nested_attributes_for :thumbnails
end
