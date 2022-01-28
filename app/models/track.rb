class Track < ApplicationRecord
  SOUND_CLOUD_REGEX = /\Ahttps?:\/\/[soundcloud.com]+\/[\w]+\/[\w]/

  belongs_to :viewer
  belongs_to :stream
  has_many :likes, dependent: :destroy

  validates :soundcloud_url, presence: true, format: { with: SOUND_CLOUD_REGEX }

  def create_likes(viewer, new_like_attributes)
    likes_amount = viewer.subscriber? ? 3 : 1
    likes_amount.times { Like.create new_like_attributes }
    reload
  end

  def destroy_likes_from(viewer)
    likes.where(viewer_id: viewer.id).destroy_all
    reload
  end
end
