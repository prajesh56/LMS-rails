class Employee < ApplicationRecord
    has_many :leaves, dependent: :destroy
    has_many :attendences, dependent: :destroy
end
