class JobPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    user.present? && user == post.user
  end

  def update?
    user.present? && user == post.user
  end

  def destroy?
    true
  end

  private

  def post
    record
  end
end
