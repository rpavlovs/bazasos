require 'spec_helper'

feature 'Emergency Contacts' do
  let!(:person) { FactoryGirl.create(:person) }
  before { log_in }

  it 'should create and show emergency contact' do
    visit person_path(person)
    click_link I18n.t('emergency_contacts.grid.add')
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  it 'should edit emergency contact' do
    emergency_contact = FactoryGirl.create(:emergency_contact, person: person)
    visit edit_person_emergency_contact_path(person, emergency_contact)
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  def fill_form
    fill_in 'emergency_contact[name]', with: 'some name'
    fill_in 'emergency_contact[relationship_type]', with: 'some relationship'
    fill_in 'emergency_contact[phones]', with: '123 456 789'
    select I18n.t('emergency_contacts.priority.1'), from: 'emergency_contact[priority]'
  end

  def check_data
    within 'table#emergency_contacts tbody' do
      page.should have_content 'some name'
      page.should have_content 'some relationship'
      page.should have_content '123 456 789'
      page.should have_content I18n.t('emergency_contacts.priority.1')
    end
  end
end
