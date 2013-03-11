require "spec_helper"

feature "Navigating on task views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content "Login efetuado com sucesso."
  end

  scenario "listing no results" do
    task_index_path
    page.has_selector?("table#tasks tbody tr", :count => 0)
  end

  scenario "creating one" do
    new_created_task
  end

  scenario "listing one result" do
    new_created_task
    page.has_selector?("table#tasks tbody tr", :count => 1)
    expect(page).to have_link "Editar"
    expect(page).to have_link "Remover"
  end

  scenario "listing five results" do
    5.times{ new_created_task }
    page.has_selector?("table#tasks tbody tr", :count => 5)
    page.has_selector?("table#tasks tbody tr td#btn-warning", :count => 5)
    page.has_selector?("table#tasks tbody tr td#btn-danger", :count => 5)
  end

  scenario "editing one result" do
    new_created_task

    page.has_selector?("table#tasks tbody tr", :count => 1)
    expect(page).to have_link "Editar"

    click_link_or_button 'Editar'

    expect(page).to have_content "Editar Tarefa"
    fill_in task_form_name, with: 'Task Modified'
    click_link_or_button 'Gravar'

    page.has_selector?("table#tasks tbody tr", :count => 1)
    expect(page).to have_content "Task Modified"
  end

  scenario "removing one result" do
    new_created_task

    page.has_selector?("table#tasks tbody tr", :count => 1)
    expect(page).to have_link "Remover"

    click_link_or_button 'Remover'

    expect(page).to have_content "Tarefa removido(a) com sucesso."

    page.has_selector?("table#tasks tbody tr", :count => 0)
  end

  private

  def task_index_path
    click_link_or_button 'Listar Tarefas'
    expect(page).to have_link "Inserir"
  end

  def new_created_task
    task_index_path
    click_link_or_button 'Inserir'
    within("#new_task") do
      fill_in task_form_name, with: 'Task name'
      fill_in I18n.t("tasks.form.price"), with: 1.5
      click_link_or_button 'Gravar'
    end
    expect(page).to have_content "Tarefa cadastrado(a) com sucesso."
  end

  def task_form_name
    I18n.t("tasks.form.name")
  end
end
