require 'spec_helper'

feature 'Medications' do
  let!(:person) { FactoryGirl.create(:person) }
  before { log_in }

  it 'should create and show medication' do
    visit person_path(person)
    click_link I18n.t('medications.grid.add')
    fill_in 'medication[title]', with: 'test medication'
    click_button I18n.t('actions.save')
    within('#medications') { page.should have_content 'test medication' }
  end

  it 'should edit medication' do
    medication = FactoryGirl.create(:medication, person: person)
    visit edit_person_medication_path(person, medication)
    fill_in 'medication[title]', with: 'test medication'
    click_button I18n.t('actions.save')
    within('#medications') { page.should have_content 'test medication' }
  end
end
