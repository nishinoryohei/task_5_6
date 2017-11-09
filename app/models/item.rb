class Item < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :user
	has_many :thumbnails ,dependent: :destroy
	accepts_nested_attributes_for :thumbnails
	validates :name,presence: true
	validates :description, presence: true
	validates :price, presence: true ,numericality: :only_integer
end
