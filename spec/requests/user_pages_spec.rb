# encoding: utf-8
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit registration_path }

    it { should have_selector('h1',    text: 'Добавить пользователя') }
    it { should have_selector('title', text: full_title('Регистрация')) }
  end

  describe "profile page" do
		# Code to make a user variable
    before { pending }
		before { visit user_path(user) }

		it { should have_selector('h1',    text: user.name) }
		it { should have_selector('title', text: user.name) }
	end
end

