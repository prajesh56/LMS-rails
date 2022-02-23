class Employee < ApplicationRecord
    has_many :leaves, dependent: :destroy
    has_many :attendence, dependent: :destroy
end
