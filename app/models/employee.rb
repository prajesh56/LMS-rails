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
  validate :startdate_valid
  validates :password, presence:true, length: { minimum: 8 }

  def startdate_valid
    if start_date.present? && start_date < Date.today
  	  errors.add(:start_date,"is not valid")
  	end
  end
end
