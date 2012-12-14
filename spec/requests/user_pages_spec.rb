# encoding: utf-8
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit registration_path }

    it { should have_selector('h1',    text: 'Добавить пользователя') }
    it { should have_selector('title', text: full_title('Регистрация')) }
  end
end