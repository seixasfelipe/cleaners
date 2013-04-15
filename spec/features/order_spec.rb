require "spec_helper"

feature "Navigating on order views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content t('devise.sessions.signed_in')
  end

  # test doesn't work (indifferent condition page.has_selector)
  scenario "listing no results" do
    order_index_path
    page.has_selector?("table#orders tbody tr", :count => 0)
  end

  scenario "creating one" do
    create_new_order
    expect(page).not_to have_content t('helpers.errors.not_found')
  end

  # test doesn't work (indifferent condition page.has_selector)
  scenario "listing one result" do
    create_new_order
    order_index_path
    page.has_selector?("table#orders tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.edit')
    expect(page).to have_link t('helpers.submit.remove')
    expect(page).not_to have_content t('helpers.errors.not_found')
  end

  scenario "editing one result" do
    create_new_order
    order_index_path
    click_link_or_button t('helpers.submit.edit')

    expect(page).to have_content t('helpers.header.edit_model', model: t('activerecord.models.order'))
    fill_in t('orders.form.order_date'), with: '21/01/2013'
    click_link_or_button t('helpers.submit.save')

    expect(page).to have_content "21/01/2033"
    expect(page).not_to have_content t('helpers.errors.not_found')
  end

  scenario "removing one result" do
    create_new_order

    page.has_selector?("table#orders tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.remove')

    click_link_or_button t('helpers.submit.remove')

    expect(page).to have_content t('flash.actions.destroy.notice', :resource_name => t('activerecord.models.order'))

    page.has_selector?("table#orders tbody tr", :count => 0)
    expect(page).to have_content t('errors.messages.record_not_found')
  end


  private

  def order_index_path
    click_link_or_button t('helpers.submit.list', model: t('activerecord.models.order'))
    expect(page).to have_link t('helpers.submit.create', model: t('activerecord.models.order'))
  end

  def create_new_order
    order_index_path
    click_link_or_button t('helpers.submit.create', model: t('activerecord.models.order'))

    vehicle = FactoryGirl.create(:vehicle)
    within("#new_order") do
      fill_in t('orders.form.order_date'), with: '20/01/2013'
      fill_in t('orders.form.vehicle_id'), with: vehicle.id
      click_link_or_button t('helpers.submit.save')
    end
    expect(page).to have_content t('flash.actions.create.notice', :resource_name => t('activerecord.models.order'))
  end
end