class Backyard < ApplicationRecord
	belongs_to :item
	validates :stock, numericality:{
						only_integer:true,
						greater_than_or_equal_to: 0,}
end
