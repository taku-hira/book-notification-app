class Book < ApplicationRecord
  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books
  has_many :notifications, dependent: :destroy

  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true
  validates :release_date, presence: true
end
