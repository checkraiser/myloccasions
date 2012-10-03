require 'spec_helper'

describe Event do
 # pending "add some examples to (or delete) #{__FILE__}"\
  it "should belong to a user" do
    event = FactoryGirl.build(:event, :user=>nil)
    event.valid?.should be_false
    event.errors[:user].should include("can't be blank")
    event.user = User.new
    event.valid?.should be_true
  end
  it "should require a name" do
    event = FactoryGirl.build(:event, :name=>nil)
    event.valid?.should be_false
    event.errors[:name].should include("can't be blank")
    event.user = User.new
    event.name = "Event Name"
    event.valid?.should be_true
  end
end

