class Leaverecord < ApplicationRecord
  belongs_to :employee
  validates :date_from, presence:true
  validates :date_to, presence:true
  validate :date_from_valid
  validates :description, presence: true, length: { maximum: 50 }
  validate :status_valid, on: :create
  def date_from_valid
    if date_from.present? && date_from < Date.today
      errors.add(:date_from,"should not be past date")
    end
    if date_to.present? && date_to < Date.today
      errors.add(:date_to,"should not be past date")
    end
  end
  def status_valid
    if status.present? && status != 'Approval Pending'
      errors.add(:status,"is to be approval pending even for admin while applying for leave")
    end
  end
end
