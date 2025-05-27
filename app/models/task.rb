class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :status, inclusion: { in: %w[pending in_progress completed] }
end
