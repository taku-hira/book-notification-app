class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :channel, presence: true, inclusion: { in: %w[email line] }
  validates :status, presence: true, inclusion: { in: %w[pending sent failed] }
end
