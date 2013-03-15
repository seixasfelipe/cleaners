require "spec_helper"

feature "Navigating on task views and" do

  background do
    user = FactoryGirl.create(:user)
    login user.username, user.password
    expect(page).to have_content t('devise.sessions.signed_in')
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
    expect(page).to have_link t('helpers.submit.edit')
    expect(page).to have_link t('helpers.submit.remove')
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
    expect(page).to have_link t('helpers.submit.edit')

    click_link_or_button t('helpers.submit.edit')

    expect(page).to have_content t('helpers.header.edit_model')
    fill_in task_form_name, with: 'Task Modified'
    click_link_or_button t('helpers.submit.save')

    page.has_selector?("table#tasks tbody tr", :count => 1)
    expect(page).to have_content "Task Modified"
  end

  scenario "removing one result" do
    new_created_task

    page.has_selector?("table#tasks tbody tr", :count => 1)
    expect(page).to have_link t('helpers.submit.remove')

    click_link_or_button t('helpers.submit.remove')

    expect(page).to have_content t('flash.actions.destroy.notice', :resource_name => t('activerecord.models.task'))

    page.has_selector?("table#tasks tbody tr", :count => 0)
  end

  private

  def task_index_path
    click_link_or_button t('helpers.submit.list', :model => t('activerecord.models.task'))
    expect(page).to have_link t('helpers.submit.create')
  end

  def new_created_task
    task_index_path
    click_link_or_button t('helpers.submit.create')
    within("#new_task") do
      fill_in task_form_name, with: 'Task name'
      fill_in t("tasks.form.price"), with: 1.5
      click_link_or_button t('helpers.submit.save')
    end
    expect(page).to have_content t('flash.actions.create.notice', :resource_name => t('activerecord.models.task'))
  end

  def task_form_name
    t("tasks.form.name")
  end
end
