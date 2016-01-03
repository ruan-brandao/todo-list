class List < ActiveRecord::Base
  scope :public_lists, -> { where(public: true) }

  belongs_to :user
  has_many :tasks

  accepts_nested_attributes_for :tasks,
                                reject_if: proc { |attributes| attributes['text'].blank? },
                                allow_destroy: true

  validates :name, presence: true

  def self.feed_for(user)
    List.where(user: user)
  end
end
