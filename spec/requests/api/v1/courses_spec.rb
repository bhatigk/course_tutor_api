require "rails_helper"

RSpec.describe "Course", type: :request do
  describe "GET /index" do
    before do
      FactoryBot.create_list(:course, 10, :with_tutors)
      get "/api/v1/course"
    end

    it "returns all courses" do
      expect(json_data.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      # let!(:course) { FactoryBot.create(:course, :with_tutors) }

      before do
        post "/api/v1/course", params: valid_params
      end

      it "returns the title" do
        expect(json_data["title"]).to eq("Programming")
      end

      it "returns the description" do
        expect(json_data["description"]).to eq("Introduction to programming")
      end

      it "returns the tutors data" do
        expect(json_data["tutors"].size).to eq(2)
        expect(json_data["tutors"][0]["first_name"]).to eq("jon")
      end

      it "returns a created status" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      before do
        post "/api/v1/course", params: invalid_params
      end

      it "returns a unprocessable entity status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

def valid_params
  {
    course: {
      title: "Programming",
      description: "Introduction to programming",
      tutors_attributes: [
        {
          first_name: "jon",
          last_name: "Doe",
          email: "jon@example.com"
        },
        {
          first_name: "jany",
          last_name: "Smith",
          email: "jany@example.com"
        }
      ]
    }
  }
end

def invalid_params
  {
    course: {
      title: "",
      description: "",
      tutors_attributes: [
        {
          first_name: "ben",
          last_name: "Doe",
          email: "ben@example.com"
        }
      ]
    }
  }
end
