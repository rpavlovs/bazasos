require 'spec_helper'

feature 'Allergies' do
  let!(:person) { FactoryGirl.create(:person) }

  it 'should create and show allergy' do
    visit person_path(person)
    click_link I18n.t('allergies.grid.add')
    fill_in 'allergy[title]', with: 'test allergy'
    click_button I18n.t('actions.save')
    within('#allergies') { page.should have_content 'test allergy' }
  end

  it 'should edit allergy' do
    allergy = FactoryGirl.create(:allergy, person: person)
    visit edit_person_allergy_path(person, allergy)
    fill_in 'allergy[title]', with: 'test allergy'
    click_button I18n.t('actions.save')
    within('#allergies') { page.should have_content 'test allergy' }
  end
end
