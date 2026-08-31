class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :title, null: false
      t.string :author
      t.string :publisher
      t.date :release_date, null: false
      t.string :image_url
      t.string :source

      t.timestamps
    end

    add_index :books, :isbn, unique: true
    add_index :books, :release_date
  end
end
