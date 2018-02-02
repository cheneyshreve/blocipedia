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

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        wikis = []
        if user.role == 'admin'
          wikis = scope.all # if the user is an admin, show them all the wikis
        elsif user.role == 'premium' # premium user
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if !wiki.private || wiki.user_id == user.id || wiki.collaborates.include?(user)
              wikis << wiki
            end
          end
        else # standard user
          all_wikis = scope.all
          wikis = []
          all_wikis.each do |wiki|
            if !wiki.private || wiki.collaborates.include?(user)
              wikis << wiki
            end
          end
        end
        wikis
      end
    end

end
