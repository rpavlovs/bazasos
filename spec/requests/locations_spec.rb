require 'spec_helper'

feature 'Locations' do
  let!(:person) { FactoryGirl.create(:person) }

  it 'should create and show location' do
    visit person_path(person)
    click_link I18n.t('locations.grid.add')
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  it 'should edit location' do
    location = FactoryGirl.create(:location, person: person)
    visit edit_person_location_path(person, location)
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  it 'should show residence first' do
    location = FactoryGirl.create(:location, person: person)
    residence = FactoryGirl.create(:location, :residence, person: person, description: 'residence')
    visit person_path(person)
    within '#locations tr:nth-child(1)' do
      page.should have_content 'residence'
    end
  end

  it 'should highlicht registration' do
    registration = FactoryGirl.create(:location, :registration, person: person, description: 'registration')
    visit person_path(person)
    within '#locations tr.info' do
      page.should have_content 'registration'
    end
  end

  def fill_form
    fill_in 'location[description]', with: 'home'
    fill_in 'location[postal_code]', with: '79137'
    select I18n.t('locations.edit.options_for_region').first, from: 'location[region]'
    fill_in 'location[city]', with: 'some city'
    fill_in 'location[street]', with: 'some street'
    fill_in 'location[street_number]', with: '11/2'
    fill_in 'location[building_number]', with: 2
    fill_in 'location[appartment]', with: 92
    fill_in 'location[floor]', with: 12
    fill_in 'location[entrance]', with: 2
    fill_in 'location[phone_number]', with: '2685478624'
    fill_in 'location[comment]', with: 'some comment'
  end

  def check_data
    within '#locations' do
      page.should have_content 'home'
      #page.should have_content '79137'
      #page.should have_content I18n.t('locations.edit.options_for_region').first
      #page.should have_content 'some city'
      page.should have_content '11/2'
      page.should have_content '2'
      page.should have_content '92'
      page.should have_content '12'
      page.should have_content '2'
    end
  end
end
