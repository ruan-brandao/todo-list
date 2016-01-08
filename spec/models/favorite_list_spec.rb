require 'rails_helper'

RSpec.describe FavoriteList, type: :model do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to belong_to(:list) }
end
