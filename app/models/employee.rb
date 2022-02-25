class Employee < ApplicationRecord
    has_many :leave, dependent: :delete_all
    has_many :attendence, dependent: :delete_all
end
