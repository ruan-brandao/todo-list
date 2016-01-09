require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { FactoryGirl.create(:task) }

  it { expect(subject).to belong_to(:list) }
  it { expect(subject).to have_many(:subtasks).dependent(:destroy) }

  it { expect(subject).to accept_nested_attributes_for(:subtasks).allow_destroy(true) }

  it { expect(subject).to validate_presence_of(:text) }

  describe "#close_subtasks" do
    it "sets every child subtasks as done" do
      subtask1 = FactoryGirl.create(:subtask, task: task)
      subtask2 = FactoryGirl.create(:subtask, task: task)

      task.close_subtasks

      expect(task.subtasks.first).to be_truthy
      expect(task.subtasks.last).to be_truthy
    end
  end
end
