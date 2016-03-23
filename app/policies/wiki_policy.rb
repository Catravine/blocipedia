class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    wiki.public? || wiki.user ==  user
  end

  def destroy?
    wiki.public? || wiki.user ==  user
  end
end
