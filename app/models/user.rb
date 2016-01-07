class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :favorite_lists
  has_many :favorites, through: :favorite_lists, class_name: "List", source: :list

  def favorite(list)
    if list.user_id == id || favorite_lists.find_by(list: list)
      nil
    else
      favorite_lists.create(list: list)
    end
  end

  def unfavorite(list)
    favorite_lists.find_by(list: list).destroy
  end
end
