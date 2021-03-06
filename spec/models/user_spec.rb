require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      @user.phone = nil
      expect(@user).to_not be_valid
    end
  end

  describe "validations" do
    it "requires for phone attribute to have only 10 character" do
       @user.phone = "123456789"
      expect(@user).to_not be_valid
    end

    it "requires phone attribute to be only numbers" do
      @user.phone = "0123456789"
      expect(@user).to be_valid
    end
  end



  describe "custom user methods" do
    it "should have full name" do
      expect(@user.full_name).to eq("PINKMAN, JESSE")
    end
  end
end
