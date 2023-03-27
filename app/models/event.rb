class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :date, presence: true

  def event_send
    UserMailer.event_email(self).deliver_now
  end
end
