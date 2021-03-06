require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:user) { FactoryGirl.create(:user) }

  describe "#login_options" do
    context "with a user signed in" do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(true)
      end

      it "calls link_to with 'Sign out'" do
        expect(helper).to receive(:link_to).with("Sign out", "/users/sign_out", method: :delete, class: "btn btn-default navbar-btn")

        helper.login_options
      end
    end

    context "without a user signed in" do
      before do
        allow(helper).to receive(:user_signed_in?).and_return(false)
      end

      it "calls link_to with 'Sign in'" do
        expect(helper).to receive(:link_to).with("Sign in", "/users/sign_in", class: "btn btn-default navbar-btn")

        helper.login_options
      end
    end
  end

  describe "#favorites_link" do
    it "returns nil without a signed in user" do
      allow(helper).to receive(:user_signed_in?).and_return(false)

      expect(helper.favorites_link).to be_nil
    end

    it "returns a link_to with a signed in user" do
      allow(helper).to receive(:user_signed_in?).and_return(true)

      expect(helper).to receive(:link_to).with("Favorites", "/favorites", class: "btn btn-default")

      helper.favorites_link
    end
  end
end
