require 'rails_helper'

feature "View public lists" do
  scenario "with success", js: true do
    owner = create(:user)
    list = create(:list, user: owner, name: "Private List")
    public_list = create(:public_list, user: owner, name: "Public List")
    user = create(:user, lists: [])

    sign_in(user)

    visit root_path

    expect(page).to have_css(".list-name", text: "Public List")
    expect(page).not_to have_css(".list-name", text: "Private List")
  end
end
