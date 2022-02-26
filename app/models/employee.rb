class Employee < ApplicationRecord
  has_many :leaverecords, dependent: :delete_all
  has_many :attendences, dependent: :delete_all
end
