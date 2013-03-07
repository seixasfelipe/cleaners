require "spec_helper"

feature "Navigating on customer views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content "Login efetuado com sucesso."
  end

  scenario "listing no results" do
    customer_index_path
    page.has_selector?("table#customers tbody tr", :count => 0)
  end

  scenario "creating one" do
    new_created_customer
    expect(page).not_to have_content "Nenhum registro encontrado."
  end

  scenario "listing one result" do
    new_created_customer
    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link "Editar"
    expect(page).to have_link "Remover"
    expect(page).not_to have_content "Nenhum registro encontrado."
  end

  scenario "listing five results" do
    5.times{ new_created_customer }
    page.has_selector?("table#customers tbody tr", :count => 5)
    page.has_selector?("table#customers tbody tr td#btn-warning", :count => 5)
    page.has_selector?("table#customers tbody tr td#btn-danger", :count => 5)
    expect(page).not_to have_content "Nenhum registro encontrado."
  end

  scenario "editing one result" do
    new_created_customer

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link "Editar"

    click_link_or_button 'Editar'

    expect(page).to have_content "Editar Cliente"
    fill_in customer_form_name, with: 'Customer Modified'
    click_link_or_button I18n.t('helpers.submit.save')

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_content "Customer Modified"
    expect(page).not_to have_content "Nenhum registro encontrado."
  end

  scenario "removing one result" do
    new_created_customer

    page.has_selector?("table#customers tbody tr", :count => 1)
    expect(page).to have_link "Remover"

    click_link_or_button 'Remover'

    expect(page).to have_content "Cliente removido(a) com sucesso."

    page.has_selector?("table#customers tbody tr", :count => 0)
    expect(page).to have_content "Nenhum registro encontrado."
  end

  private

  def customer_index_path
    click_link_or_button 'Listar Clientes'
    expect(page).to have_link "Inserir novo"
  end

  def new_created_customer
    customer_index_path
    click_link_or_button 'Inserir novo'
    within("#new_customer") do
      fill_in customer_form_name, with: 'Customer name'
      fill_in I18n.t("customers.form.email"), with: 'customer@test.com'
      click_link_or_button I18n.t('helpers.submit.save')
    end
    expect(page).to have_content "Cliente cadastrado(a) com sucesso."
  end

  def customer_form_name
    I18n.t("customers.form.name")
  end
end
