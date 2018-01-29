class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, post)
    @user = user
    @wiki = wiki
  end

  def update?
    user.present?
  end

end
