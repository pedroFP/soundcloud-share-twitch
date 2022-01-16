class Like < ApplicationRecord
  belongs_to :viewer
  belongs_to :track, counter_cache: true
end
