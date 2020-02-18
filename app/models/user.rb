class User < ApplicationRecord
  has_secure_password

  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 50},
                    format: {with: URI::MailTo::EMAIL_REGEXP},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  has_many :hosted_events, class_name: 'Event', dependent: :destroy, inverse_of: :creator
  has_and_belongs_to_many :attended_events, association_foreign_key: :event_id, class_name: 'Event', inverse_of: :attendees

  before_destroy { attended_events.clear }

  def attend(event_id)
    attended_events << Event.where(id: event_id)
  end

  def do_not_attend(event_id)
    attended_events.delete(event_id)
  end
end
