class Personal < ApplicationRecord
	belongs_to :user
	include JpPrefecture
  	jp_prefecture :state
  	validates :state, presence: true
  	validates :city, presence: true
  	validates :address, presence: true
  	VALID_TEL_REGEX = \d{2,5}-\d{1,4}-\d{4}
  	validates :tel, presence: true, format:{ with: VALID_TEL_REGEX }
end
