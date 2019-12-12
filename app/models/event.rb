class Event < ApplicationRecord
  validates_presence_of :description
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
end
