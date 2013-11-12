require 'spec_helper'

describe Parser do
  context 'stuff' do

    it 'should be be able to successfully import a csv file' do
      course = FactoryGirl.create(:course, name: "Speling", user_id: 1)

      path = Rails.root + "spec/data/test_csv_file.csv"
      fake_csv = double(:path => path)

      count = course.students.count
      Parser.import(fake_csv, course)

      course.students.count.should == count + 4
    end
  end
end