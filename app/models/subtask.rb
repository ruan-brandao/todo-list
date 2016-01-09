class Subtask < ActiveRecord::Base
  belongs_to :task

  validates :text, presence: true
end
