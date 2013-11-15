require 'spec_helper'

describe Group do
  it {should belong_to :course}
  it {should have_many(:pods)}
  it {should have_many(:enrollments).through(:pods)}
  it {should have_many(:students).through(:enrollments)}
  it {should have_many(:student_assignments).through(:students)}
  it {should have_many(:assignments).through(:student_assignments)}





  context '.list_specific_attribute' do

    let(:student){Student.create(:first_name=> "emily", :last_name => "last_name", :average => 95)}
    let(:group){Group.create(:course_id => 1)}

    it 'should take in a student and find all of a students assignments', :js => true do
      StudentAssignment.create(:student_id => student.id, :assignment_id => 1, :pod_id => 1, :grade => 100)
      StudentAssignment.create(:student_id => student.id, :assignment_id => 2, :pod_id => 1, :grade => 90)
      StudentAssignment.create(:student_id => student.id, :assignment_id => 3, :pod_id => 1, :grade => 100)
      StudentAssignment.create(:student_id => student.id, :assignment_id => 4, :pod_id => 1, :grade => 0)
      
      assignments = Group.list_specific_attribute(student, "grade")

      assignments.should == [100, 90, 100,0]
    end
  end

  context '.average' do
    # before
    #  - create 2 students, with assignments who's grades will have a lower average and higher average



    let(:student1){Student.create(:first_name=> "emily", :last_name => "last_name", :average => 95)}
    let(:student2){Student.create(:first_name=> "betsy", :last_name => "last_name", :average => 80)}
    
    it 'should sort students by descending averages' do
      students = []
      students << student1 << student2
      Group.average(students)
      students.should == [student2, student1]
    end

    it 'should return the average of a student' do
      StudentAssignment.create(:student_id => student1.id, :assignment_id => 2, :pod_id => 1, :grade => 75)
      StudentAssignment.create(:student_id => student1.id, :assignment_id => 3, :pod_id => 1, :grade => 100)
      StudentAssignment.create(:student_id => student1.id, :assignment_id => 4, :pod_id => 1, :grade => 50)
      assignments = []

    end



  end


end

