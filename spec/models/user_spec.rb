require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user =
      User.create(
        first_name: "Melvin",
        last_name: "Hong",
        email: "melvin@me.com",
        password: "melvin",
        password_confirmation: "melvin"
      )
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "should have a valid first name" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have a valid last name" do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have a valid email" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have a unique email" do
    @user2 =
      User.create(
        first_name: "Kelvin",
        last_name: "Hong",
        email: "MELVIN@ME.com",
        password: "kelvin",
        password_confirmation: "kelvin"
      )
    @user2.valid?
    expect(@user2.errors.full_messages).to_not be_empty
  end

  it "should have an inputted password" do
    @user.password = nil
    @user.password_confirmation = nil
    @user.valid?
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have matching password and confirmation" do
    @user.password_confirmation = "melvinnn"
    @user.valid?
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have at least 5 characters in the password" do
    @user.password = "no"
    @user.password_confirmation = "no"
    @user.valid?
    expect(@user.errors.full_messages).to_not be_empty
  end
end
