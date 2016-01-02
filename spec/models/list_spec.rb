require 'rails_helper'

RSpec.describe List, type: :model do
  it { expect(subject).to belong_to(:user) }

  it { expect(subject).to validate_presence_of(:name) }
end
