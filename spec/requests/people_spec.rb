require 'spec_helper'

feature 'People' do
  let!(:person) { FactoryGirl.create(:person, cell_num: '1234567980') }

  it 'should list people' do
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

  context 'search' do
    let!(:another_person) { FactoryGirl.create(:person, cell_num: '0987654321') }

    it 'should search by family_name' do
      visit people_path
      fill_in 'search[family_name]', with: person.family_name
      click_button I18n.t('actions.search')
      within 'table#people tbody' do
        page.should have_content person.family_name
        page.should_not have_content another_person.family_name
      end
    end

    it 'should search by cell number' do
      visit people_path
      fill_in 'search[phone_number]', with: person.cell_num
      click_button I18n.t('actions.search')
      within 'table#people tbody' do
        page.should have_content person.family_name
        page.should_not have_content another_person.family_name
      end
    end

    it 'should search by location phone number' do
      location = FactoryGirl.create(:location, person: person, phone_number: '1231231321')

      visit people_path
      fill_in 'search[phone_number]', with: location.phone_number
      click_button I18n.t('actions.search')
      within 'table#people tbody' do
        page.should have_content person.family_name
        page.should_not have_content another_person.family_name
      end

      another_location = FactoryGirl.create(:location, person: another_person, phone_number: location.phone_number)
      fill_in 'search[phone_number]', with: location.phone_number
      click_button I18n.t('actions.search')
      within 'table#people tbody' do
        page.should have_content person.family_name
        page.should have_content another_person.family_name
      end
    end
  end

  it 'should show warnings' do
    visit person_path(person)
    page.should have_content I18n.t('people.alerts.no_registration')
    page.should have_content I18n.t('people.alerts.no_residence')

    FactoryGirl.create(:location, :residence, person: person)
    visit person_path(person)
    page.should have_content I18n.t('people.alerts.no_registration')
    page.should_not have_content I18n.t('people.alerts.no_residence')

    FactoryGirl.create(:location, :registration, person: person)
    visit person_path(person)
    page.should_not have_content I18n.t('people.alerts.no_registration')
    page.should_not have_content I18n.t('people.alerts.no_residence')
  end

  it 'should edit person' do
    visit person_path(person)
    click_link I18n.t('actions.edit')
    fill_in 'person[family_name]', with: 'Kant'
    fill_in 'person[tax_num]', with: '7418529630'
    choose 'person_rh_factor_false'
    click_button "Update #{Person.model_name.human}"

    person.reload
    person.family_name.should == 'Kant'
    person.tax_num.should == '7418529630'
    person.rh_factor.should == false
  end
end
