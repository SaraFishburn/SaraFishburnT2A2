class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # setup relations, ensure to prevent orphan records with dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviews_made, class_name: 'Review', foreign_key: :reviewer_id, dependent: :destroy

  has_one_attached :profile_pic

  has_many :messages, dependent: :destroy

  has_and_belongs_to_many :printers
  has_and_belongs_to_many :filaments
  has_and_belongs_to_many :chatrooms, dependent: :destroy

  # run the make owner method before saving user record
  before_save :make_owner

  # use rails scope to give ability to filter in a complex way based on distance from a location
  scope :within_range, lambda { |lat, long, dist|
                         dist *= 0.009009009 # multiplier to convert kilometers to degrees in latitude and longitude
                         where.not(address: nil)
                              .where(latitude: (lat - dist)..(lat + dist))
                              .where(longitude: (long - dist)..(long + dist))
                       }

  # method to find the user's name to be displayed publicly to other users
  def public_name
    nickname || first_name
  end

  # method to provide the role of owner when a user adds their address to their account
  def make_owner
    add_role :owner if !(has_role? :owner) && !address_change_to_be_saved.nil?
  end

  # method to calculate a user's average rating from the ratings attached to their reviews
  def average_rating
    ratings = reviews.pluck(:rating)
    return 0 if ratings.empty?

    ratings.sum / ratings.length.to_f
  end
end
