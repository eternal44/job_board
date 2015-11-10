class JobPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.admin? || user.employer? || user.employer?
  end

  def show?
    user.present? && user == job.user || user.admin? || user.attendant?
  end

  def update?
    user.present? && user == job.user || user.admin?
  end

  def destroy?
    user.admin? || user == job.user
  end

  private

  def job
    record
  end
end
