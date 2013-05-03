require 'spec_helper'

feature "Navigating home" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content t('devise.sessions.signed_in')
  end

  scenario "listing only open orders" do
    order = FactoryGirl.create :order, :with_items

    click_link_or_button t('helpers.header.home')

    expect(page).to have_content t('helpers.header.open_orders')
    expect(page).to have_content order.vehicle.license_plate
    expect(page).to have_content order.vehicle.customer.name
  end

end
