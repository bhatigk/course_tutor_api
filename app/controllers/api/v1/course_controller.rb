module Api
  module V1
    class CourseController < ApplicationController
      def index
        courses = Course.includes(:tutors)
        render json: { data: ActiveModelSerializers::SerializableResource.new(courses, each_serializer: Api::V1::CourseSerializer) }, status: :ok
      end

      def create
        course = Course.new(course_params)

        if course.save
          render json: { data: ActiveModelSerializers::SerializableResource.new(course, serializer: Api::V1::CourseSerializer), message: "Course and tutors created successfully" }, status: :created
        else
          render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def course_params
        params.require(:course).permit(:title, :description, tutors_attributes: %i(first_name last_name email))
      end
    end
  end
end
