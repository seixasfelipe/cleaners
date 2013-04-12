require "spec_helper"

feature "Navigating on state views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content t('devise.sessions.signed_in')
  end

  scenario "listing no results" do
    state_index_path
    page.has_selector?("table#states tbody tr", :count => 0)
  end

  scenario "creating one" do
    new_created_state
  end

  scenario "listing one result" do
    new_created_state
    page.has_selector?("table#states tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.edit')
    expect(page).to have_link t('helpers.submit.remove')
  end

  scenario "listing five results" do
    5.times{ new_created_state }
    page.has_selector?("table#states tbody tr", :count => 5)
    page.has_selector?("table#states tbody tr td#btn-warning", :count => 5)
    page.has_selector?("table#states tbody tr td#btn-danger", :count => 5)
  end

  scenario "editing one result" do
    new_created_state

    page.has_selector?("table#states tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.edit')

    click_link_or_button t('helpers.submit.edit')

    expect(page).to have_content t('helpers.header.edit_model', model: state_model)
    fill_in state_form_name, with: 'state Modified'
    click_link_or_button t('helpers.submit.save')

    page.has_selector?("table#states tbody tr", :count => 1)
    expect(page).to have_content "state Modified"
  end

  scenario "removing one result" do
    new_created_state

    page.has_selector?("table#states tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.remove')

    click_link_or_button t('helpers.submit.remove')

    expect(page).to have_content t('flash.actions.destroy.notice', :resource_name => state_model)

    page.has_selector?("table#states tbody tr", :count => 0)
  end

  private

  def state_index_path
    click_link_or_button t('helpers.submit.list', :model => state_model)
    expect(page).to have_link t('helpers.submit.create', :model => state_model)
  end

  def new_created_state
    country = FactoryGirl.create(:country)
    state_index_path
    click_link_or_button t('helpers.submit.create', :model => state_model)
    within("#new_state") do
      fill_in state_form_name, with: 'state name'
      fill_in t("states.form.abbreviation"), with: 'state abbreviation'
      select(country.name, from: t("states.form.country"))
      click_link_or_button t('helpers.submit.save')
    end
    expect(page).to have_content t('flash.actions.create.notice', :resource_name => state_model)
  end

  def state_form_name
    t("states.form.name")
  end

  def state_model
    t('activerecord.models.state')
  end
end
