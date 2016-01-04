require 'rails_helper'

RSpec.describe ListsHelper, type: :helper do
  let(:list) { FactoryGirl.create(:list) }

  describe "#list_management" do
    context "with a user signed in" do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(true)
      end

      it "returns nil when the current user did not create the list" do
        user = FactoryGirl.create(:user_with_no_lists)
        allow(helper).to receive(:current_user).and_return(user)

        expect(helper.list_management(list)).to be_nil
      end

      it "does not returns nil when the current user created the list" do
        allow(helper).to receive(:current_user).and_return(list.user)

        expect(helper.list_management(list)).not_to be_nil
      end
    end

    it "returns nil without a user signed in" do
      allow(helper).to receive(:user_signed_in?).and_return(false)

      expect(helper.list_management(list)).to be_nil
    end
  end

  describe "#new_list_button" do
    it "returns nil without a user signed in" do
      allow(helper).to receive(:user_signed_in?).and_return(false)

      expect(helper.new_list_button).to be_nil
    end

    it "returns a link to a new list with a user signed in" do
      allow(helper).to receive(:user_signed_in?).and_return(true)

      expect(helper).to receive(:link_to).with("New List", new_list_path, class: "btn btn-primary")

      helper.new_list_button
    end
  end
end
