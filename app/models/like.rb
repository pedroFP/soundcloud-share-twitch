class Like < ApplicationRecord
  belongs_to :viewer
  belongs_to :track, counter_cache: true

  validate :search_repeated, on: %i[create]

  def search_repeated
    max_like_amount = viewer.subscriber? ? 3 : 1

    return if viewer.likes.where(track_id: track_id).size < max_like_amount

    errors.add :viewer, :repeated, message: 'Cannot like the same track'
  end
end
