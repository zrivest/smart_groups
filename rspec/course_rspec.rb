 require 'spec_helper'

 describe Course do
  it { should belong_to(:user) }
  it { should have_many(:graphs) }
  it { should have_many(:assignments) }
  it { should have_many(:enrollments) }
  it { should have_many(:students) }.through(:enrollments)
  it { should have_many(:groups)}
  it { should have_many(:pods)}.through(:groups)
  it { should have_many(:student_assignments)}.through(:pods)

end