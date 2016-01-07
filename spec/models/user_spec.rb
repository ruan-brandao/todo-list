require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:list) { FactoryGirl.create(:list) }
  let(:favorite_list) { FactoryGirl.create(:favorite_list) }

  it { expect(subject).to have_many(:lists) }
  it { expect(subject).to have_many(:favorite_lists) }
  it { expect(subject).to have_many(:favorites).
                          through(:favorite_lists).
                          class_name("List") }

  describe "favorited?" do
    it "returns true when the user favorited the list" do
      user.favorite(list)

      expect(user.favorited?(list)).to be_truthy
    end

    it "returns false when the user did not favorite the list" do
      expect(user.favorited?(list)).to be_falsy
    end
  end

  describe "can_favorite?" do
    it "returns false when the user already favorited the list" do
      allow(user).to receive(:favorited?).with(list).and_return(true)

      expect(user.can_favorite?(list)).to be_falsy
    end

    it "returns false when the user created the list" do
      owner = list.user

      expect(owner.can_favorite?(list)).to be_falsy
    end

    it "returns true when the user didn't create or favorite the list" do
      expect(user.can_favorite?(list)).to be_truthy
    end
  end

  describe "#favorite" do
    it "creates a new favorite list when the user can favorite the list" do
      allow(user).to receive(:can_favorite?).with(list).and_return(true)

      expect{ user.favorite(list) }.to change{ FavoriteList.count }.from(0).to(1)
    end

    it "returns nil when the user can't favorite the list" do
      allow(user).to receive(:can_favorite?).with(list).and_return(false)

      expect(user.favorite(list)).to be_nil
    end
  end

  describe "#unfavorite" do
    it "removes one favorite list record" do
      favorite_list = FactoryGirl.create(:favorite_list)
      user = favorite_list.user
      list = favorite_list.list

      expect{ user.unfavorite(list) }.to change{ FavoriteList.count }.from(1).to(0)
    end
  end
end
