class List < ActiveRecord::Base
  scope :public_lists, -> { where(public: true) }

  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :favorite_lists
  has_many :users_who_favorited, through: :favorite_lists, class_name: "User"

  accepts_nested_attributes_for :tasks,
                                reject_if: proc { |attributes| attributes['text'].blank? },
                                allow_destroy: true

  validates :name, presence: true

  def self.feed_for(user)
    (self.where(user: user) + self.public_lists).uniq!
  end
end
