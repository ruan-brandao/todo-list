require 'rails_helper'

RSpec.describe Subtask, type: :model do
  it { expect(subject).to belong_to(:task) }

  it { expect(subject).to validate_presence_of(:text) }
end
