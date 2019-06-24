class Url < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
end
