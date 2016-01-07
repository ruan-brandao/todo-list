require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(subject).to have_many(:lists) }
  it { expect(subject).to have_many(:favorite_lists) }
  it { expect(subject).to have_many(:favorites).
                          through(:favorite_lists).
                          class_name("List") }

  describe "#favorite" do
    it "creates a new favorite list record" do
      user = FactoryGirl.create(:user)
      list = FactoryGirl.create(:list)

      expect{ user.favorite(list) }.to change{ FavoriteList.count }.from(0).to(1)
    end

    it "returns nil when the user signed in created the list" do
      list = FactoryGirl.create(:list)
      owner = list.user

      expect(owner.favorite(list)).to be_nil
    end

    it "returns nil when the signed in user already favorited the list" do
      favorite_list = FactoryGirl.create(:favorite_list)
      user = favorite_list.user
      list = favorite_list.list

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
