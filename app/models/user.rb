class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  validates :role, inclusion: { in: %w[user admin] }
end
