class Employee < ApplicationRecord
  has_many :leaverecords, dependent: :delete_all
  has_many :attendences, dependent: :delete_all
  validates :name, presence: true, length: { maximum: 25 }, format: { with: /[a-zA-Z_]/, message: "should be only characters"}
  validates :address, presence: true, length: { maximum: 25 }, format: { with: /[a-zA-Z_]/, message: "should be only characters"}
  validates :email, presence: true, uniqueness: true
  validates :contact, presence: true, length: { is: 10 },format: { with: /\A\d+\z/, message: "should be number"}
  validates :role, presence: true
  validates :email, presence: true, uniqueness: true
  validates :start_date, presence: true
  validate :startdate_valid, on: :create
  validates :password, presence:true, length: { minimum: 8 }
  validate :joindate_changed?, on: :update
  def startdate_valid
    if start_date.present? && start_date < Date.today
  	  errors.add(:start_date,"is not valid")
  	end
  end
  def joindate_changed?
    if start_date_changed? && self.persisted?
      errors.add(:start_date,"cannot be changed")
    end
  end
end
