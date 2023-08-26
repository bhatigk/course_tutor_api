module Api
  module V1
    class CourseSerializer < ActiveModel::Serializer
      attributes :id, :title, :description

      has_many :tutors, serializer: Api::V1::TutorSerializer
    end
  end
end
