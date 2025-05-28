class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  enum :status, {
    pending: "pending",
    in_progress: "in_progress",
    completed: "completed"
  }, default: :pending

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
