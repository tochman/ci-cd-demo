# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    if params[:controller] == 'articles'
      redirect_to new_subscription_path, notice: 'You need to purchase a subscription to view this article'
    else
      redirect_to root_path, notice: 'You are not allowed to perform this action'
    end
  end
end
