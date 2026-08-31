require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com", password: "password123") }
  let(:book) { Book.create!(isbn: "9784000000000", title: "テスト本", release_date: Date.today + 30) }

  it "is valid with a user, book, channel and status" do
    notification = Notification.new(user: user, book: book, channel: "email", status: "pending")
    expect(notification).to be_valid
  end

  it "defaults status to pending" do
    notification = Notification.create!(user: user, book: book, channel: "email")
    expect(notification.status).to eq("pending")
  end

  it "is invalid with an unsupported channel" do
    notification = Notification.new(user: user, book: book, channel: "sms", status: "pending")
    expect(notification).not_to be_valid
  end
end
