require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) { 
    @user = User.create(
      name: 'Testy Tester',
      email: 'tester@aol.com',
      username: 'TestyT123'
    )
  }

  subject { @user }

  it { 
    should respond_to(:name)
    should respond_to(:email)
    should respond_to(:username)
  }

  it { should be_valid }

  # Name tests
  describe "missing name" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "name too short" do
    before { @user.name = "a" }
    it { should_not be_valid }
  end

  describe "name too long" do 
    before { @user.name = "a" * 41 }
    it { should_not be_valid }
  end

  # Email tests
  describe "missing email" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "invalid emails" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |addr|
        @user.email = addr
        expect(@user).to be_invalid
      end
    end
  end

  describe "valid emails" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |addr|
        @user.email = addr
        expect(@user).to be_valid
      end
    end
  end

  describe "duplicate email" do
    it "should not allow duplicate emails" do
      dup_user = @user.dup
      dup_user.username = "DupDupUser"
      addresses = [@user.email, @user.email.upcase]

      addresses.each do |addr|
        dup_user.email = addr
        dup_user.save
        expect(dup_user).to be_invalid 
      end
    end
  end

  # Username tests
  describe "missing username" do
    before { @user.username = "" }
    it { should_not be_valid }
  end

  describe "duplicate username" do
    it "should not allow duplicate usernames" do
      dup_user = @user.dup
      dup_user.email = "dup@dup.com"
      user_ids = [@user.username, @user.username.upcase]

      user_ids.each do |user_id|
        dup_user.username = user_id
        dup_user.save
        expect(dup_user).to be_invalid
      end
    end
  end
end
