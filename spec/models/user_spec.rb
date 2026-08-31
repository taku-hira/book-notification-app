require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email and password" do
    user = User.new(name: "テストユーザー", email: "test@example.com", password: "password123")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(email: "test@example.com", password: "password123")
    expect(user).not_to be_valid
  end

  it "is invalid without a unique email" do
    User.create!(name: "既存ユーザー", email: "dup@example.com", password: "password123")
    user = User.new(name: "新規ユーザー", email: "dup@example.com", password: "password123")
    expect(user).not_to be_valid
  end

  it "authenticates with the correct password" do
    user = User.create!(name: "テストユーザー", email: "auth@example.com", password: "password123")
    expect(user.valid_password?("password123")).to be true
    expect(user.valid_password?("wrongpassword")).to be false
  end
end
