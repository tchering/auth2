# frozen_string_literal: true

class User < ApplicationRecord
  normalizes :email, with: ->(email) { email.strip.downcase }

  # def email =(value)
  #   super(value.strip.downcase)
  # end
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, confirmation: true
  validates :role, presence: true
  has_secure_password

  def is_admin?
    role == "admin"
  end

  def is_editor?
    role == "editor"
  end
end
