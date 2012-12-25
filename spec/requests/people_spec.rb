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

  it 'should create new person' do
    expect {
      visit people_path
      click_link I18n.t('people.index.add')
      fill_in 'person[family_name]', with: 'Landau'
      fill_in 'person[given_name]', with: 'Lev'
      fill_in 'person[middle_name]', with: 'Davidovich'
      fill_in 'person[birth_date]', with: '22.01.1908'
      choose 'person_gender_true'
      fill_in 'person[tax_num]', with: '1234567890'
      fill_in 'person[cell_num]', with: '1234567890'
      select '1 (0)', from: 'person[blood_type]'
      choose 'person_rh_factor_true'
      fill_in 'person[additional_details]', with: 'additional details'
      click_button "Create #{Person.model_name.human}"
    }.to change{ Person.count }.by(1)
  end

  it 'should search' do
    person = FactoryGirl.create(:person)
    another_person = FactoryGirl.create(:person)
    visit people_path
    fill_in 'search[family_name]', with: person.family_name
    click_button I18n.t('actions.search')
    within 'table#people tbody' do
      page.should have_content person.family_name
      page.should_not have_content another_person.family_name
    end
  end

  it 'should show warnings' do
    person = FactoryGirl.create(:person)
    visit person_path(person)
    within '.alert' do
      page.should have_content I18n.t('people.alerts.no_registration')
      page.should have_content I18n.t('people.alerts.no_residence')
    end
  end
end