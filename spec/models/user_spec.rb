# encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  login           :string(255)
#  last_name       :string(255)
#  first_name      :string(255)
#  middle_name     :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do

  before {
  	@user = User.new(
  		login: "rpavlovs",
			last_name: "Павловский",
			first_name: "Роман",
			middle_name: "Александрович",
			password: "foobar",
			password_confirmation: "foobar")
  }

  subject { @user }

  it { should respond_to(:login) }
  it { should respond_to(:last_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when login is not present" do
    before { @user.login = " " }
    it { should_not be_valid }
  end

  describe "when login is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when login is too long" do
  	before { @user.login = 'a' * 51 }
  	it { should_not be_valid }
  end

  describe "when login is too short" do
  	before { @user.login = 'a' * 4 }
  	it { should_not be_valid }
  end

  describe "when login is already taken" do
    before do
      user_with_same_login = @user.dup
      user_with_same_login.login = @user.login.upcase
      user_with_same_login.save
    end
    it { should_not be_valid }
  end

  describe "email address with mixed case" do
    let(:mixed_case_login) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.login = mixed_case_login
      @user.save
      @user.reload.login.should == mixed_case_login.downcase
    end
  end

  describe "when password is not present" do
	  before { @user.password = @user.password_confirmation = " " }
	  it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
	  before { @user.password_confirmation = "mismatch" }
	  it { should_not be_valid }
	end

	describe "when password confirmation is nil" do
	  before { @user.password_confirmation = nil }
	  it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_login(@user.login) }

		describe "with valid password" do
		  it { should == found_user.authenticate(@user.password) }
		end

		describe "with invalid password" do
    	let(:user_for_invalid_password) { found_user.authenticate("invalid") }

    	it { should_not == user_for_invalid_password }
    	specify { user_for_invalid_password.should be_false }
  	end
	end

	describe "with a password that's too short" do
	  before { @user.password = @user.password_confirmation = "a" * 5 }
	  it { should be_invalid }
	end
end
