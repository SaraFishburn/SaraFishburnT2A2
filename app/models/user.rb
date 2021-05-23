class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :ratings
  has_many :printers
  has_many :filaments_and_resins

  has_one_attached :profile_pic

  scope :within_range, lambda { |lat, long, dist|
                         dist *= 0.009009009
                         where.not(address: nil)
                              .where(latitude: (lat - dist)..(lat + dist))
                              .where(longitude: (long - dist)..(long + dist))
                       }
  
end
