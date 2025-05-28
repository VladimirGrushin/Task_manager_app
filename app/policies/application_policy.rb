class TaskPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.admin? || record.user == user
  end
end
