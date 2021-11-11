class Stream < ApplicationRecord
  has_many :tracks
  belongs_to :admin
  validates :title, presence: true
end
