class Track < ApplicationRecord
  belongs_to :viewer
  belongs_to :stream

  validates :soundcloud_url, presence: true
end
