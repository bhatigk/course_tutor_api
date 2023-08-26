class Course < ApplicationRecord
  has_many :tutors
  accepts_nested_attributes_for :tutors, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :description, presence: true
end
