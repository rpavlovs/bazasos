module LoginHelper
  def log_in
    password = 'password'
    user = FactoryGirl.create(:user, password: password)
    visit new_session_path
    fill_in 'credentials[login]', with: user.login
    fill_in 'credentials[password]', with: password
    click_button I18n.t('sessions.new.login')
  end
end
