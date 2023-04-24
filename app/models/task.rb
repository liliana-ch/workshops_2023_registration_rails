class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true
  validate :check_deadline_possibility, if: :deadline_changed?

  def check_deadline_possibility
    return if deadline >= Time.zone.today
    errors.add(:deadline, 'must not be before today')
  end
end
