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
end