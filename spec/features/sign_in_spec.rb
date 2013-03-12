require "spec_helper"

feature "Signing in" do

  scenario "with valid credentials" do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(current_path).to eq root_path
    expect(page).to have_content t('devise.sessions.signed_in')
    expect(page).to have_text t('helpers.header.shortcuts')
  end

  scenario "with incorrect credentials" do
    login 'bla', 'blablabla'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_text t('devise.failure.not_found_in_database')
  end

end
