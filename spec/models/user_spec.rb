require 'spec_helper'

describe User do

  it "has a working factory" do
    FactoryGirl.create(:user).should be_valid
  end
  
  it "requires a first name" do
    # @invalid_user = FactoryGirl.build(:user, :firstname => nil)
    # @invalid_user.save.should raise_error
    # 
    FactoryGirl.build(:user, :firstname => nil).save.should raise_error
  end

  it "requires a properly formatted email" do
    FactoryGirl.build(:user, :email => "anemail.com@").save.should raise_error
  end

  it "requires a unique email" do
    FactoryGirl.create(:user, :email => "an_email@email.com")
    FactoryGirl.build(:user, :email => "an_email@email.com").save.should raise_error
  end
  
  
  
  
end