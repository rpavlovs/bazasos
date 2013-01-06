require 'spec_helper'

feature 'Sessions' do
  it 'should redirect to login screen' do
    visit people_path
    page.should have_content I18n.t('sessions.new.title')
  end

  it 'should not redirect to login screen if logged in' do
    log_in
    visit people_path
    page.should have_content I18n.t('people.index.title')
  end

  it 'should log in a user' do
    user = FactoryGirl.create(:user)
    visit new_session_path
    fill_in 'credentials[login]', with: user.login
    fill_in 'credentials[password]', with: 'password'
    click_button I18n.t('sessions.new.login')
    page.should have_content I18n.t('people.index.title')
  end

  it 'should not log in a user with wrong password' do
    user = FactoryGirl.create(:user)
    visit new_session_path
    fill_in 'credentials[login]', with: user.login
    fill_in 'credentials[password]', with: 'wrong password'
    click_button I18n.t('sessions.new.login')
    page.should have_content I18n.t('sessions.new.title')
  end

  it 'should redirect to root if logged in' do
    log_in
    visit new_session_path
    page.should have_content I18n.t('people.index.title')
  end

  it 'should log out' do
    log_in
    visit log_out_path
    page.should have_content I18n.t('sessions.new.title')
  end

  it 'should not show navigation for logged in users only' do
    visit new_session_path
    within '.header' do
      page.should_not have_content I18n.t('people.index.add')
      page.should_not have_content I18n.t('users.index.title')
      page.should_not have_content I18n.t('sessions.log_out')
    end
    log_in
    within '.header' do
      page.should have_content I18n.t('people.index.add')
      page.should have_content I18n.t('users.index.title')
      page.should have_content I18n.t('sessions.log_out')
    end
  end
end
