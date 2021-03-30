# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string
#  email           :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) { 
    @user = User.create(
      name: 'Testy Tester',
      email: 'tester@aol.com',
      username: 'TestyT123',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  }

  subject { @user }

  it { 
    should respond_to(:name)
    should respond_to(:email)
    should respond_to(:username)
    should respond_to(:password_digest)
    should respond_to(:password)
    should respond_to(:password_confirmation)
    should respond_to(:authenticate)
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

  # Password tests
  describe "blank password" do
    before { @user.password = @user.password_confirmation = ' ' }
    it { should be_invalid }
  end

  describe "password <> confirmation" do
    before { @user.password_confirmation = 'mismatch' } 
    it { should be_invalid }
  end

  describe "password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should be_invalid }
  end

  describe "password is too short" do
    before { @user.password = @user.password_confirmation = 'a' * 5 }
    it { should be_invalid }
  end

  # Authentication tests
  describe "return value of authenticate method" do
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid pw" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid pw" do
      let(:user_for_invalid_pw) { found_user.authenticate("invalid") }

      specify { expect(user_for_invalid_pw).to_not eq @user }
      specify { expect(user_for_invalid_pw).to be_falsey }
    end
  end
end
