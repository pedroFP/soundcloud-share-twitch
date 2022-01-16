class Like < ApplicationRecord
  belongs_to :viewer
  belongs_to :track, counter_cache: true

  validate :search_repeated, on: %i[create]

  def search_repeated
    return if viewer.likes.where(track_id: track_id).empty?

    errors.add :viewer, :repeated, message: 'Cannot like the same track twice'
  end
end
