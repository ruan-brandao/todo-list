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

  describe "#subtasks_completed?" do
    it "returns true when all of the child subtasks are done" do
      subtask1 = FactoryGirl.create(:subtask, done: true, task: task)
      subtask2 = FactoryGirl.create(:subtask, done: true, task: task)

      expect(task.subtasks_completed?).to be_truthy
    end

    it "returns false when one of the subtasks is not done" do
      subtask = FactoryGirl.create(:subtask, task: task)
      completed_subtask = FactoryGirl.create(:subtask, done: true, task: task)

      expect(task.subtasks_completed?).to be_falsy
    end
  end

  describe "#complete_by_subtasks" do
    it "sets task as done when the subtasks are done" do
      allow(task).to receive(:subtasks_completed?).and_return(true)

      task.complete_by_subtasks

      expect(task.done).to be_truthy
    end

    it "doesn't do anything when the subtasks are not done" do
      allow(task).to receive(:subtasks_completed?).and_return(false)

      task.complete_by_subtasks

      expect(task.done).to be_falsy
    end
  end
end
