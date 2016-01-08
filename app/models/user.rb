class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :favorite_lists
  has_many :favorites, through: :favorite_lists, class_name: "List", source: :list

  def favorited?(list)
    favorite_lists.find_by(list: list)
  end

  def can_favorite?(list)
    ! favorited?(list) && list.user_id != id
  end

  def favorite(list)
    if can_favorite?(list)
      favorite_lists.create(list: list)
    else
      nil
    end
  end

  def unfavorite(list)
      favorite_lists.find_by(list: list).destroy if favorited? list
  end
end
