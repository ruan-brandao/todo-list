require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { FactoryGirl.create(:list) }
  let(:user) { FactoryGirl.create(:user) }

  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:tasks).dependent(:destroy) }
  it { expect(subject).to have_many(:favorite_lists) }
  it { expect(subject).to have_many(:users_who_favorited).
                          through(:favorite_lists).
                          class_name("User") }

  it { expect(subject).to accept_nested_attributes_for(:tasks).allow_destroy(true) }

  it { expect(subject).to validate_presence_of(:name) }

  describe ".feed_for" do
    it "returns the feed for user" do
      public_list = FactoryGirl.create(:public_list)
      allow(List).to receive(:feed_for).with(user).and_return([public_list])

      expect(List.feed_for(user)).to eq([public_list])
    end
  end
end
