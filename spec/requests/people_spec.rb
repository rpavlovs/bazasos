require 'spec_helper'

feature 'People' do
  let!(:person) { FactoryGirl.create(:person, cell_num: '1234567980') }
  before { log_in }

  it 'should list people' do
    visit people_path
    within '#people' do
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
      click_button I18n.t('actions.save')
    }.to change{ Person.count }.by(1)
  end

  it 'should edit person' do
    visit person_path(person)
    click_link I18n.t('actions.edit')
    fill_in 'person[family_name]', with: 'Kant'
    fill_in 'person[tax_num]', with: '7418529630'
    choose 'person_rh_factor_false'
    click_button I18n.t('actions.save')

    person.reload
    person.family_name.should == 'Kant'
    person.tax_num.should == '7418529630'
    person.rh_factor.should == false
  end
end
