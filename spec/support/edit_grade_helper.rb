module EditGradeHelper

  def edit_student_assignment_grade(course, user)
    user_login_to_page(user)
    click_button "Edit Course"
    fill_in "student_assignment_grade", with: 10
    click_button "Save Assignment"
  end
end