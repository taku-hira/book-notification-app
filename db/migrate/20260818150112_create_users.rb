class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :line_user_id

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :line_user_id, unique: true
  end
end
