class Track < ApplicationRecord
  SOUND_CLOUD_REGEX = /\Ahttps?:\/\/[soundcloud.com]+\/[\w]+\/[\w]/

  belongs_to :viewer
  belongs_to :stream
  has_many :likes, dependent: :destroy

  validates :soundcloud_url, presence: true, format: { with: SOUND_CLOUD_REGEX }
end
