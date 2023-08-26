module Api
  module V1
    class TutorSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email
    end
  end
end
