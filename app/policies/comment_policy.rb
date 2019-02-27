# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def destroy?
    @record.user == @user || @user.moderator?
  end
end
