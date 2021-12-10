class Track < ApplicationRecord
  SOUND_CLOUD_REGEX = /\Ahttps?:\/\/[soundcloud.com]+\/[\w]+\/[\w]/

  belongs_to :viewer
  belongs_to :stream

  validates :soundcloud_url, presence: true, format: { with: SOUND_CLOUD_REGEX }
end
