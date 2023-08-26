require "rails_helper"

RSpec.describe Tutor, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:course) }
  end

  describe "validations" do
    subject { FactoryBot.build(:tutor) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
