require 'spec_helper'

feature 'Allergies' do
  let!(:person) { FactoryGirl.create(:person) }

  it 'should create and show allergy' do
    visit person_path(person)
    click_link I18n.t('allergies.grid.add')
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  it 'should edit allergy' do
    allergy = FactoryGirl.create(:allergy, person: person)
    visit edit_person_allergy_path(person, allergy)
    fill_form
    click_button I18n.t('actions.save')
    check_data
  end

  def fill_form
    fill_in 'allergy[allergen]', with: 'some allergen'
    fill_in 'allergy[allergen_type]', with: 'some type'
    fill_in 'allergy[reaction]', with: 'some reaction'
  end

  def check_data
    within 'table#allergies tbody' do
      page.should have_content 'some allergen'
      page.should have_content 'some type'
      page.should have_content 'some reaction'
    end
  end
end
