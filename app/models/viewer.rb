class Viewer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :skip_password_validation  # virtual attribute to skip password validation while saving

  has_many :likes, dependent: :destroy
  has_many :tracks, dependent: :destroy
  has_many :liked_tracks, through: :likes, source: :track
  
  protected

  def password_required?
    return false if skip_password_validation

    super
  end
end
