require "spec_helper"

feature "Navigating on vehicle views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content t('devise.sessions.signed_in')
  end

  scenario "listing no results" do
    vehicle_index_path
    page.has_selector?("table#vehicles tbody tr", :count => 0)
  end

  scenario "creating one" do
    create_new_vehicle
    expect(page).not_to have_content t('helpers.errors.not_found')
  end

  scenario "listing one result" do
    create_new_vehicle
    page.has_selector?("table#vehicles tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.edit')
    expect(page).to have_link t('helpers.submit.remove')
    expect(page).not_to have_content t('helpers.errors.not_found')
  end

# scenario "listing five results" do
#   5.times{ create_new_vehicle }
#   page.has_selector?("table#vehicles tbody tr", :count => 10)
#   page.has_selector?("table#vehicles tbody tr td#btn-warning", :count => 10)
#   page.has_selector?("table#vehicles tbody tr td#btn-danger", :count => 10)
#   expect(page).not_to have_content t('helpers.errors.not_found')
# end

  scenario "editing one result" do
    create_new_vehicle

    click_link_or_button t('helpers.submit.edit')

    expect(page).to have_content t('helpers.header.edit_model', model: t('activerecord.models.vehicle'))
    fill_in t('vehicles.form.license_plate'), with: 'ZZZ1234'
    click_link_or_button t('helpers.submit.save')

    expect(page).to have_content "ZZZ1234"
    expect(page).not_to have_content t('helpers.errors.not_found')
  end

  scenario "removing one result" do
    create_new_vehicle

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.remove')

    click_link_or_button t('helpers.submit.remove')

    expect(page).to have_content t('flash.actions.destroy.notice', :resource_name => t('activerecord.models.vehicle'))

    page.has_selector?("table#customers tbody tr", :count => 0)
    expect(page).to have_content t('errors.messages.record_not_found')
  end



  private

  def vehicle_index_path
    click_link_or_button t('helpers.submit.list', model: t('activerecord.models.vehicle'))
    expect(page).to have_link t('helpers.submit.create', model: t('activerecord.models.vehicle'))
  end

  def create_new_vehicle
    vehicle_index_path
    click_link_or_button t('helpers.submit.create', model: t('activerecord.models.vehicle'))
    within("#new_vehicle") do
      fill_in t('vehicles.form.license_plate'), with: 'XXZ4550'
      click_link_or_button t('helpers.submit.save')
    end
    expect(page).to have_content t('flash.actions.create.notice', :resource_name => t('activerecord.models.vehicle'))
  end
  
end
