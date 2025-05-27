class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  devise :database_authenticatable, :registerable, :validatable
  validates :role, inclusion: { in: %w[user admin] }
end
