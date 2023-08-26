class Tutor < ApplicationRecord
  belongs_to :course

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
