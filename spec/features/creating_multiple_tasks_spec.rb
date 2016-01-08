require 'rails_helper'

feature "Create multiple tasks" do
  scenario "with success", js: true do
    list_name = "New list"
    task_name = "New task"
    user = create(:user)

    sign_in(user)

    visit root_path
    click_on "New List"
    fill_in "Name", with: list_name

    4.times { click_link "Add Task" }
    task_inputs = page.all('input[placeholder=Task]')
    task_inputs.each { |e| e.set(task_name) }

    click_button "Create List"

    expect(page).to have_css("h1", text: list_name)
    expect(page).to have_css(".task", text: task_name, count: 5)
  end
end
