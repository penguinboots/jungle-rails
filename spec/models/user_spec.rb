require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user =
        User.create(
          email: "melvin@me.com",
          password: "melvin",
          password_confirmation: "melvin"
        )
    end

    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end

    it "should have a valid email" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have a unique email" do
      @user2 =
        User.create(
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

  describe ".authenticate_with_credentials" do
    before do
      @user =
        User.create(
          email: "melvin@me.com",
          password: "melvin",
          password_confirmation: "melvin"
        )
    end

    it "should log in if email and password match" do
      email = "melvin@me.com"
      password = "melvin"

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user)
    end

    it "should not log in if email and password do not match" do
      email = "melvin@me.com"
      password = "kelvin"

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to_not eq(@user)
    end
    
    it "should log in if email has extra spaces" do
      email = "  melvin@me.com"
      password = "melvin"

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user)
    end

    it "should log in if email uses mixed cases" do
      email = "MeLviN@Me.com"
      password = "melvin"

      @user2 = User.authenticate_with_credentials(email, password)
      expect(@user2).to eq(@user)
    end

  end
end
