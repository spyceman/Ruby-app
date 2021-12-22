require "rails_helper"

describe User do
    let(:attributes) do
      {
        email: "User",
        password: "qwerty123456",
      }
    end
    
    let(:missing_email) { attributes.except(:email) }
    let(:missing_password) { attributes.except(:password) }
  
    it "is considered valid" do
      expect(User.new(attributes)).to be_valid
    end

    it "is invalid without an email" do
      expect(User.new(missing_email)).not_to be_valid
    end
  
    it "is invalid without a password" do
      expect(User.new(missing_password)).not_to be_valid
    end
  end