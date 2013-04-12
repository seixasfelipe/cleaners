require "spec_helper"

feature "Navigating on country views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content t('devise.sessions.signed_in')
  end

  scenario "listing no results" do
    country_index_path
    page.has_selector?("table#countries tbody tr", :count => 0)
  end

  scenario "creating one" do
    new_created_country
  end

  scenario "listing one result" do
    new_created_country
    page.has_selector?("table#countries tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.edit')
    expect(page).to have_link t('helpers.submit.remove')
  end

  scenario "listing five results" do
    5.times{ new_created_country }
    page.has_selector?("table#countries tbody tr", :count => 5)
    page.has_selector?("table#countries tbody tr td#btn-warning", :count => 5)
    page.has_selector?("table#countries tbody tr td#btn-danger", :count => 5)
  end

  scenario "editing one result" do
    new_created_country

    page.has_selector?("table#countries tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.edit')

    click_link_or_button t('helpers.submit.edit')

    expect(page).to have_content t('helpers.header.edit_model', model: country_model)
    fill_in country_form_name, with: 'country Modified'
    click_link_or_button t('helpers.submit.save')

    page.has_selector?("table#countries tbody tr", :count => 1)
    expect(page).to have_content "country Modified"
  end

  scenario "removing one result" do
    new_created_country

    page.has_selector?("table#countries tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.remove')

    click_link_or_button t('helpers.submit.remove')

    expect(page).to have_content t('flash.actions.destroy.notice', :resource_name => country_model)

    page.has_selector?("table#countries tbody tr", :count => 0)
  end

  private

  def country_index_path
    click_link_or_button t('helpers.submit.list', :model => country_model)
    expect(page).to have_link t('helpers.submit.create', :model => country_model)
  end

  def new_created_country
    country_index_path
    click_link_or_button t('helpers.submit.create', :model => country_model)
    within("#new_country") do
      fill_in country_form_name, with: 'country name'
      fill_in t("countries.form.abbreviation"), with: 'country abbreviation'
      click_link_or_button t('helpers.submit.save')
    end
    expect(page).to have_content t('flash.actions.create.notice', :resource_name => country_model)
  end

  def country_form_name
    t("countries.form.name")
  end

  def country_model
    t('activerecord.models.country')
  end
end
