class Category < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :item
	validates :color, presence: true
	validates :area, presence: true
	enum color: { red: 1, white:2}
	enum area: {france:10, italy:20, spain:30, germany:40,america:50,japan:60,
	              australia:70, newzealand:80}
	              
end
