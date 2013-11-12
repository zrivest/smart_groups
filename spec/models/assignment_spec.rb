require 'spec_helper'

describe Assignment do
  context '#parser test' do
    it 'should create an assignment on the import of student from a CSV file' do
      course = FactoryGirl.create(:course, name: "Speling", user_id: 1)

      path = Rails.root + "spec/data/test_csv_file.csv"
      fake_csv = double(:path => path)

      Parser.import(fake_csv, course)

      expect(Assignment.last.assignment_name).to eq("Math test 2")
    end
  end
end