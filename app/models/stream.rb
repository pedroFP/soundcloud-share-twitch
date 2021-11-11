class Stream < ApplicationRecord
  belongs_to :admin
  validates :title, presence: true
end
