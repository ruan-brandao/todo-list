require 'rails_helper'

RSpec.describe Task, type: :model do
  it { expect(subject).to belong_to(:list) }
  it { expect(subject).to have_many(:subtasks).dependent(:destroy) }

  it { expect(subject).to accept_nested_attributes_for(:subtasks).allow_destroy(true) }

  it { expect(subject).to validate_presence_of(:text) }
end
