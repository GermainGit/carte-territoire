class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :content
      t.float :long
      t.float :lat
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
