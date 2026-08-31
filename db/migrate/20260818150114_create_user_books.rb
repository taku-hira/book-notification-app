class CreateUserBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :user_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :notify_before_days, null: false, default: 1

      t.timestamps
    end

    add_index :user_books, [:user_id, :book_id], unique: true
  end
end
