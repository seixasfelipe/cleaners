require "spec_helper"

feature "Navigating on item views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end

  scenario "listing no results" do
    item_index_path
    page.has_selector?("table#items tbody tr", :count => 0)
  end

  scenario "creating one" do
    new_created_item
  end

  scenario "listing one result" do
    new_created_item
    page.has_selector?("table#items tbody tr", :count => 1)
    expect(page).to have_link I18n.t('helpers.submit.edit')
    expect(page).to have_link I18n.t('helpers.submit.remove')
  end

  scenario "listing five results" do
    5.times{ new_created_item }
    page.has_selector?("table#items tbody tr", :count => 5)
    page.has_selector?("table#items tbody tr td#btn-warning", :count => 5)
    page.has_selector?("table#items tbody tr td#btn-danger", :count => 5)
  end

  scenario "editing one result" do
    new_created_item

    page.has_selector?("table#items tbody tr", :count => 1)
    expect(page).to have_link I18n.t('helpers.submit.edit')

    click_link_or_button I18n.t('helpers.submit.edit')

    expect(page).to have_content I18n.t('helpers.header.edit_model')
    fill_in item_form_name, with: 'item Modified'
    click_link_or_button I18n.t('helpers.submit.save')

    page.has_selector?("table#items tbody tr", :count => 1)
    expect(page).to have_content "item Modified"
  end

  scenario "removing one result" do
    new_created_item

    page.has_selector?("table#items tbody tr", :count => 1)
    expect(page).to have_link I18n.t('helpers.submit.remove')

    click_link_or_button I18n.t('helpers.submit.remove')

    expect(page).to have_content I18n.t('flash.actions.destroy.notice', :resource_name => I18n.t('activerecord.models.item'))

    page.has_selector?("table#items tbody tr", :count => 0)
  end

  private

  def item_index_path
    click_link_or_button 'Listar Itens'
    expect(page).to have_link I18n.t('helpers.submit.create')
  end

  def new_created_item
    item_index_path
    click_link_or_button I18n.t('helpers.submit.create')
    within("#new_item") do
      fill_in item_form_name, with: 'item name'
      fill_in I18n.t("items.form.price"), with: 1.5
      click_link_or_button I18n.t('helpers.submit.save')
    end
    expect(page).to have_content I18n.t('flash.actions.create.notice', :resource_name => I18n.t('activerecord.models.item'))
  end

  def item_form_name
    I18n.t("items.form.name")
  end
end
