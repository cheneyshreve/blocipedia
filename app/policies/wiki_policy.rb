class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, post)
    @user = user
    @wiki = wiki
  end

  def update?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def destroy?
    user.present?
  end

end
