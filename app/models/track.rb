class Track < ApplicationRecord
  belongs_to :viewer

  validates :soundcloud_url, presence: true
end
