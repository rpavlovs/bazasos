require 'spec_helper'

feature 'People' do
  it 'should list people' do
    person = FactoryGirl.create(:person)
    visit people_path
    within 'table#people tbody' do
      page.should have_content person.family_name
      page.should have_content person.given_name
      page.should have_content person.middle_name
      page.should have_content person.cell_num
    end
  end
end
