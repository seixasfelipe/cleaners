require "spec_helper"

feature "Navigating on customer views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end

  scenario "listing no results" do
    customer_index_path
    page.has_selector?("table#customers tbody tr", :count => 0)
  end

  scenario "creating one" do
    new_created_customer
    expect(page).not_to have_content I18n.t('helpers.errors.not_found')
  end

  scenario "listing one result" do
    new_created_customer
    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link I18n.t('helpers.submit.edit')
    expect(page).to have_link I18n.t('helpers.submit.remove')
    expect(page).not_to have_content I18n.t('helpers.errors.not_found')
  end

  scenario "listing five results" do
    5.times{ new_created_customer }
    page.has_selector?("table#customers tbody tr", :count => 5)
    page.has_selector?("table#customers tbody tr td#btn-warning", :count => 5)
    page.has_selector?("table#customers tbody tr td#btn-danger", :count => 5)
    expect(page).not_to have_content I18n.t('helpers.errors.not_found')
  end

  scenario "editing one result" do
    new_created_customer

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link I18n.t('helpers.submit.edit')

    click_link_or_button I18n.t('helpers.submit.edit')

    expect(page).to have_content I18n.t('helpers.header.edit_model')
    fill_in customer_form_name, with: 'Customer Modified'
    click_link_or_button I18n.t('helpers.submit.save')

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_content "Customer Modified"
    expect(page).not_to have_content I18n.t('helpers.errors.not_found')
  end

  scenario "removing one result" do
    new_created_customer

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link I18n.t('helpers.submit.remove')

    click_link_or_button I18n.t('helpers.submit.remove')

    expect(page).to have_content I18n.t('flash.actions.destroy.notice', :resource_name => I18n.t('activerecord.models.customer'))

    page.has_selector?("table#customers tbody tr", :count => 0)
    expect(page).to have_content I18n.t('errors.messages.record_not_found')
  end

  private

  def customer_index_path
    click_link_or_button I18n.t('helpers.submit.list', :model => I18n.t('activerecord.models.customer'))
    expect(page).to have_link "Inserir novo"
  end

  def new_created_customer
    customer_index_path
    click_link_or_button 'Inserir novo'
    within("#new_customer") do
      fill_in customer_form_name, with: 'Customer name'
      fill_in I18n.t('customers.form.email'), with: 'customer@test.com'
      click_link_or_button I18n.t('helpers.submit.save')
    end
    expect(page).to have_content I18n.t('flash.actions.create.notice', :resource_name => I18n.t('activerecord.models.customer'))
  end

  def customer_form_name
    I18n.t('customers.form.name')
  end
end
