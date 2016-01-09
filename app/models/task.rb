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
end
