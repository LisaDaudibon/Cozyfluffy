class Event < ApplicationRecord
  belongs_to :user


  validates :title, presence: true
  validates :date, presence: true
  def start_time
    self.date
  end

  after_create :event_send
  def event_send
    User.all.each do |user|
    UserMailer.event_email(user,self).deliver_now
    end
  end
end
