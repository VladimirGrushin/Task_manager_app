class User < ApplicationRecord
  enum :role, { user: "user", admin: "admin" }, default: :user


  has_many :tasks, dependent: :destroy

  devise :database_authenticatable, :registerable, :validatable

  private
end
