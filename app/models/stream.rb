class Stream < ApplicationRecord
  has_many :tracks, dependent: :destroy
  belongs_to :admin
  validates :title, presence: true
end
