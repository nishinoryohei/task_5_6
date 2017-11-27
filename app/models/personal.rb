class Personal < ApplicationRecord
	belongs_to :user
	include JpPrefecture
  	jp_prefecture :state
end
