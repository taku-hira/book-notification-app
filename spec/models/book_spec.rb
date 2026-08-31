require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with an isbn, title and release_date" do
    book = Book.new(isbn: "9784000000000", title: "テスト本", release_date: Date.today + 30)
    expect(book).to be_valid
  end

  it "is invalid without a unique isbn" do
    Book.create!(isbn: "9784000000001", title: "既存本", release_date: Date.today)
    book = Book.new(isbn: "9784000000001", title: "新規本", release_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid without a release_date" do
    book = Book.new(isbn: "9784000000002", title: "テスト本")
    expect(book).not_to be_valid
  end
end
