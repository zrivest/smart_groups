require 'spec_helper'

describe Student do
  context '#associations' do
    let(:course) { FactoryGirl.create(:course) }
    let(:assignment) { FactoryGirl.create(:assignment) }
    let(:group) { FactoryGirl.create(:group) }
    let(:student) { FactoryGirl.create(:student) }

    it 'should be able to access a grade for a particular assignment' do
      sa = StudentAssignment.create(student_id: 1, assignment_id: 1, grade: 88)
      student.student_assignments << sa

      expect(student.student_assignments.first.grade).to eq(88)
    end
  end

  context '#parser test' do
      it 'should be be able to successfully import a new student object tied to a course' do
      course = FactoryGirl.create(:course, name: "Speling", user_id: 1)

      path = Rails.root + "spec/data/test_csv_file.csv"
      fake_csv = double(:path => path)

      count = course.students.count
      Parser.import(fake_csv, course)

      course.students.last.first_name.should == "ryan"
    end
  end
end