class Task < ActiveRecord::Base
  belongs_to :list
  has_many :subtasks

  validates :text, presence: true
end
