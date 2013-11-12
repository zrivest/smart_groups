require 'spec_helper'

describe Course do
  context '#associations' do
    let(:course) { FactoryGirl.create(:course) }
    let(:assignment) { FactoryGirl.create(:assignment) }

    it 'should have many groups' do
      course.groups << Group.new << Group.new

      expect(course.groups.length).to be(2)
    end

    it 'should haave many assignments' do
      course.assignments << assignment << assignment

      expect(course.assignments.length).to be(2)
    end
  end
end