class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    editable?
  end

  def update?
    editable?
  end

  def destroy?
    editable?
  end

  def editable?
    wiki.public? || user.admin? || wiki.user == user || !(Collaborator.where(user_id: user.id, wiki_id: wiki.id).empty?)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if user.role == 'admin'
      wikis = []
      scope.all.each do |wiki|
        if wiki.public? || wiki.user == user || !(Collaborator.where(user_id: user.id, wiki_id: wiki.id).empty?)
          wikis << wiki
        end
      end
      wikis
    end
  end
end
