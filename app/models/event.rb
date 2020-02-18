class Event < ApplicationRecord
  validate :date_cannot_be_in_the_past
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  has_and_belongs_to_many :attendees, association_foreign_key: :user_id, class_name: 'User'

  before_destroy { attendees.clear }

  scope :not_hosted_by, -> (current_user) { where.not(user_id: current_user) }
  scope :upcoming, -> { where('events.date > ?', current_time) }
  scope :past, -> { where('events.date < ?', current_time) }

  class << self
    def current_time
      Time.current.in_time_zone(Time.now.zone).time
    end
  end

  private

    def date_cannot_be_in_the_past
      errors.add(:date, "can't be in the past") if date.time.before? self.class.current_time
    end
end
