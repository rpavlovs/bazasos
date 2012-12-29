require 'spec_helper'


feature 'Medications' do
  let!(:person) { FactoryGirl.create(:person) }

  it 'should create and show medication' do
    visit person_path(person)
    click_link I18n.t('medications.grid.add')
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  it 'should edit medication' do
    medication = FactoryGirl.create(:medication, person: person)
    visit edit_person_medication_path(person, medication)
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  def fill_form
    fill_in 'medication[name]', with: 'some title'
    fill_in 'medication[med_type]', with: 'some type'
    fill_in 'medication[dose]', with: 'some dose'
  end

  def check_data
    within 'table#medications tbody' do
      page.should have_content 'some title'
      page.should have_content 'some type'
      page.should have_content 'some dose'
    end
  end
end
