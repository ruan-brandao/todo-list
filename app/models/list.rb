class List < ActiveRecord::Base
  scope :public_lists, -> { where(public: true) }

  belongs_to :user

  validates :name, presence: true

  def self.feed_for(user)
    List.where(user: user)
  end
end
