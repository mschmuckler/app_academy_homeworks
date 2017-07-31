require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User model" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end

  describe "#is_password?" do
    it "should return true for correct password" do
      user = User.new(email: 'joe', password: '1234567')
      expect(user.is_password?('1234567')).to be_truthy
    end

    it "should return false for incorrect password" do
      user = User.new(email: 'joe', password: '1234567')
      expect(user.is_password?('7192830')).to be_falsy
    end
  end

  describe "#reset_session_token!" do
    it "should change change user's session_token" do
      user = User.create(email: 'joe', password: '1234567')
      token = user.session_token
      user.reset_session_token!

      expect(user.session_token).not_to eq(token)
    end
  end

  describe "::find_by_credentials" do
    it "should return the user by their email and password" do
      user = User.create(email: 'joe', password: '1234567')

      expect(User.find_by_credentials('joe', '1234567')).to eq(user)
    end
  end
end
