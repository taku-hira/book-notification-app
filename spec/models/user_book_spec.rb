require 'rails_helper'

RSpec.describe UserBook, type: :model do
  let(:user) { User.create!(name: "テストユーザー", email: "test@example.com", password: "password123") }
  let(:book) { Book.create!(isbn: "9784000000000", title: "テスト本", release_date: Date.today + 30) }

  it "is valid with a user, book and notify_before_days" do
    user_book = UserBook.new(user: user, book: book, notify_before_days: 3)
    expect(user_book).to be_valid
  end

  it "defaults notify_before_days to 1" do
    user_book = UserBook.create!(user: user, book: book)
    expect(user_book.notify_before_days).to eq(1)
  end

  it "does not allow the same user to follow the same book twice" do
    UserBook.create!(user: user, book: book)
    duplicate = UserBook.new(user: user, book: book)
    expect(duplicate).not_to be_valid
  end
end
