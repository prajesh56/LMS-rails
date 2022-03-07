class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :leaverecords, dependent: :delete_all
  has_many :attendences, dependent: :delete_all
  has_one_attached :avatar, dependent: :delete_all
end
