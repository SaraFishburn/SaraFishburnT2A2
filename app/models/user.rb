class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :reviews_made, class_name: 'Review', foreign_key: :reviewer_id, dependent: :destroy

  has_one_attached :profile_pic

  has_many :messages, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_and_belongs_to_many :printers
  has_and_belongs_to_many :filaments
  has_and_belongs_to_many :chatrooms, dependent: :destroy

  before_save :make_owner

  scope :within_range, lambda { |lat, long, dist|
                         dist *= 0.009009009
                         where.not(address: nil)
                              .where(latitude: (lat - dist)..(lat + dist))
                              .where(longitude: (long - dist)..(long + dist))
                       }

  def public_name
    nickname || first_name
  end

  def make_owner
    add_role :owner if !(has_role? :owner) && !address_change_to_be_saved.nil?
  end

  def ordered_rooms
    chatrooms.joins(:messages).merge(Message.order(created_at: :desc))
  end

  def average_rating
    ratings = reviews.pluck(:rating)
    return 0 if ratings.empty?

    ratings.sum / ratings.length.to_f
  end
end
