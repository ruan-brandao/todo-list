class Task < ActiveRecord::Base
  belongs_to :list

  validates :text, presence: true
end
