require 'rails_helper'

feature "Closing Subtasks" do
  scenario "Close parent task when close all subtasks" do
    list_name = "List Name"
    task_name = "Task Name"
    subtask_name = "Subtask Name"
    user = create(:user)
    list = create(:list, user: user, name: list_name)

    sign_in user

    visit root_path
    click_link list_name
    click_link "Edit List"
    fill_in "Task", with: task_name
    fill_in "Subtask", with: subtask_name
    check("list_tasks_attributes_0_subtasks_attributes_0_done")

    click_button "Update List"

    expect(page).to have_css("#task_done[checked='checked']")
  end

  scenario "Close subtask when parent task closes" do
    list_name = "List Name"
    task_name = "Task Name"
    subtask_name = "Subtask Name"
    user = create(:user)
    list = create(:list, user: user, name: list_name)

    sign_in user

    visit root_path
    click_link list_name
    click_link "Edit List"
    fill_in "Task", with: task_name
    fill_in "Subtask", with: subtask_name
    check("list_tasks_attributes_0_done")

    click_button "Update List"

    expect(page).to have_css("#subtask_done[checked='checked']")
  end
end
