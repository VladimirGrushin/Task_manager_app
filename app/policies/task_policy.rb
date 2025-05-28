class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || record.user_id == user.id
  end

  def create?
    true
  end

  def update?
    user.admin? || record.user_id == user.id
  end

  def destroy?
    user.admin? || record.user_id == user.id
  end

  def admin_index?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
