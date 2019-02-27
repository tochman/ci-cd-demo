# frozen_string_literal: true

class User < ApplicationRecord

  after_initialize :set_default_role, if: :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments

  enum role: %i[visitor moderator subscriber]

  private

  def set_default_role
    self.role ||= :visitor
  end
end
