class Task < ActiveRecord::Base
  belongs_to :list
  has_many :subtasks, dependent: :destroy

  accepts_nested_attributes_for :subtasks,
                                reject_if: proc { |attributes| attributes['text'].blank? },
                                allow_destroy: true

  validates :text, presence: true

  def close_subtasks
    subtasks.update_all(done: true)
  end

  def subtasks_completed?
    subtasks.all?(&:done) && subtasks.count > 0
  end

  def complete_by_subtasks
    update(done: true) if subtasks_completed?
  end
end
