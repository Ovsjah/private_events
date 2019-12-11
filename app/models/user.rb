class User < ApplicationRecord
  has_secure_password

  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 50},
                    format: {with: URI::MailTo::EMAIL_REGEXP},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end
