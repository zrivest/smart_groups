require 'spec_helper'

describe Course do
  context '#associations' do
    let(:course) { FactoryGirl.create(:course) }
    let(:assignment) { FactoryGirl.create(:assignment) }

    it 'should have many groups' do
      course.groups << Group.new << Group.new

      expect(course.groups.length).to be(2)
    end

    it 'should have many assignments' do
      course.assignments << assignment << assignment

      expect(course.assignments.length).to be(2)
    end

    it 'should have many students through assignments' do
      s1 = FactoryGirl.create(:student)
      s2 = FactoryGirl.create(:student)

      course.assignments << assignment
      course.assignments.first.students << s1 << s2

      expect(course.assignments.first.students.length).to be(2)
    end

    it 'should have many enrollments' do
      e1 = FactoryGirl.create(:enrollment)
      e2 = FactoryGirl.create(:enrollment)

      course.enrollments << e1 << e2

      expect(course.enrollments.length).to be(2)
    end
  end
end