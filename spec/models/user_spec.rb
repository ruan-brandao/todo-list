require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(subject).to have_many(:lists) }
  it { expect(subject).to have_many(:favorite_lists) }
  it { expect(subject).to have_many(:favorites).
                          through(:favorite_lists).
                          class_name("List") }
end
