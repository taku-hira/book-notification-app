class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, uniqueness: { scope: :book_id }
  validates :notify_before_days, numericality: { greater_than_or_equal_to: 0 }
end
