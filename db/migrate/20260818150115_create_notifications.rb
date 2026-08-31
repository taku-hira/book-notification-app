class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :channel, null: false
      t.string :status, null: false, default: "pending"
      t.datetime :sent_at

      t.timestamps
    end
  end
end
