class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exercises
  has_many :friendships
  has_many :friends, through: :friendships, class_name: "User"

  self.per_page = 2

  def full_name
    "#{first_name} #{last_name}"
  end

  # def average_speed
    # duration_array = exercises.map { |e| e.duration_in_min }
    # distance_array = exercises.map { |e| e.distance }
    # total_duration_in_seconds = duration_array.reduce(:+) * 60
    # total_distance = distance_array.reduce(:+)
    # (total_distance / total_duration_in_seconds).round(2)
  # end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) ||
      self == new_friend
  end

  def current_friendship(friend)
    friendships.where(friend: friend).first
  end

  def self.search_by_last_name(name)
    where('last_name LIKE ?', "%#{name}%").order(:last_name)
  end
end
