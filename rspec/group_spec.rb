require 'spec_helper'

describe Group do
  it {should have_many(:pods)}
  it {should have_many(:enrollments).through(:pods)}
  it {should have_many(:students).through(:enrollments)}
  it {should have_many(:student_assignments).through(:students)}
  it {should have_many(:assignments).through(:student_assignments)}
  it {should belong_to :pods}

  context '.random' do
    let!(:student1){create(:student, :first_name => "Emily", :average => 43 )}
    let!(:student2){create(:student, :first_name => "Zach", :average => 85)}
    let!(:student3){create(:student, :first_name => "Ryan", :average => 95)}
  end
