class CreateThumbnails < ActiveRecord::Migration[5.1]
  def change
    create_table :thumbnails do |t|
      t.string :image
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
