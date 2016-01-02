require 'rails_helper'

RSpec.describe List, type: :model do
  it { expect(subject).to belong_to(:user) }

  it { expect(subject).to validate_presence_of(:name) }

  describe ".feed_for" do
    it "returns empty if the user has no posts" do
      user = FactoryGirl.create(:user_with_no_lists)

      expect(List.feed_for(user)).to be_empty
    end
  end
end
