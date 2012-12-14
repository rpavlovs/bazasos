# encoding: utf-8
require 'spec_helper'

describe "People pages" do

  subject { page }

  describe "Listing people page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Listing people') }
    it { should have_selector('title', text:  full_title('')) }
  end

end