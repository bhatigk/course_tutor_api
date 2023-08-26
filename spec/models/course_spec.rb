require "rails_helper"

RSpec.describe Course, type: :model do
  subject { FactoryBot.build(:course, tutors: [FactoryBot.build(:tutor)]) }

  describe "associations" do
    it { is_expected.to have_many(:tutors) }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end

  describe "nested attributes" do
    it { is_expected.to accept_nested_attributes_for(:tutors).allow_destroy(true) }
  end
end
