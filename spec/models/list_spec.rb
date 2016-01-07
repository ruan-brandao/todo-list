require 'rails_helper'

RSpec.describe List, type: :model do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:tasks).dependent(:destroy) }
  it { expect(subject).to have_many(:favorite_lists) }
  it { expect(subject).to have_many(:users_who_favorited).
                          through(:favorite_lists).
                          class_name("User") }

  it { expect(subject).to accept_nested_attributes_for(:tasks).allow_destroy(true) }

  it { expect(subject).to validate_presence_of(:name) }

  describe ".feed_for" do
    it "returns empty if the user has no posts" do
      user = FactoryGirl.create(:user_with_no_lists)

      expect(List.feed_for(user)).to be_empty
    end
  end
end
