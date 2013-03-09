require "spec_helper"

feature "Signing up" do

  scenario "with valid params" do
    visit root_path
    click_link I18n.t('helpers.links.create_user')
    expect(current_path).to eq new_user_registration_path
    within("#new_user") do
      fill_in 'First name', with: 'First name'
      fill_in 'Last name', with: 'Last name'
      fill_in 'Username', with: 'username'
      fill_in 'Email', with: 'user@name.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_link_or_button I18n.t('helpers.links.create_user')
    end
    expect(current_path).to eq root_path
    #expect(page).to have_content "Bem vindo!"
    #expect(page).to have_text "Atalhos"
  end

  scenario "with invalid params" do
    visit root_path
    click_link I18n.t('helpers.links.create_user')
    expect(current_path).to eq new_user_registration_path
    within("#new_user") do
      click_link_or_button I18n.t('helpers.links.create_user')
    end
    expect(current_path).to eq user_registration_path
    #expect(page).to have_content "Por favor, verifique os problemas abaixo"
  end

end
