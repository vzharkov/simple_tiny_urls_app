class Url < ApplicationRecord
  validates :url, url: true

  scope :ordered, -> { order(id: :desc) }
end
