class Track < ApplicationRecord
  SOUND_CLOUD_REGEX = /\Ahttps?:\/\/[soundcloud.com]+\/[\w]+\/[\w]/

  belongs_to :viewer
  belongs_to :stream
  has_many :likes, dependent: :destroy

  validates :soundcloud_url, presence: true, format: { with: SOUND_CLOUD_REGEX }

  def create_likes_for_subs(viewer_is_sub)
    2.times { Track.increment_counter :likes_count, id } if viewer_is_sub
    reload
  end

  def destroy_likes_for_subs(viewer_is_sub)
    2.times { Track.decrement_counter :likes_count, id } if viewer_is_sub
    reload
  end
end
