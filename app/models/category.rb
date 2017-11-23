class Category < ApplicationRecord
	belongs_to :item
	enum color: { red: 1, white:2}
	enum area: {france:10, italy:20, spain:30, germany:40,america:50,japan:60,
	              australia:70, newzealand:80}
end
