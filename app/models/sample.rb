class Sample < ApplicationRecord
  belongs_to :stream

  validates :name, presence: true
  validates :link, presence: true
end
