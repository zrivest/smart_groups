3.times do
  name = ["english_101", "LithuanianLit_202", "Calculus_61", "Mrs-Stevensons-Pre-Kay"]
  user_id = (1..20).to_a
  Course.create(name: name.sample, user_id: user_id.sample)
end

100.times do
  start_date = Time.new.strftime("%m-%d-%Y")
  due_date = ["12-08-2013", "11-20-2013", "12-23-13", "11-24-13", "01-12-14", "12-22-13", "12-20-13", "12-19-13"]

  Assignment.create(start_date: start_date, due_date: due_date.sample )
end

100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Student.create(first_name: first_name, last_name: last_name)
end

User.create(email: "rskelley9@gmail.com", password: "password")
User.create(email: "hoovs@hoovs.com", password: "password")
User.create(email: "asdf@asdf.com", password: "asdf")
User.create(email: "wolfman@wolfman.com", password: "password")

100.times do
  grade = (40..99).to_a
  student_id = (1..100).to_a
  assignment_id = (1..100).to_a

  StudentAssignment.create(grade: grade.sample, 
                          student_id: student_id.sample, 
                          assignment_id: assignment_id.sample,
                          pod_id: rand(1..5),
                          grade: rand(65..100),
                          liked_pod: rand(1..5),
                          learned_in_pod: rand(1..5))
end

Enrollment.create(student_id: 1, course_id: 1)
Enrollment.create(student_id: 1, course_id: 2)
Enrollment.create(student_id: 1, course_id: 3)
Enrollment.create(student_id: 2, course_id: 1)
Enrollment.create(student_id: 3, course_id: 1)
Enrollment.create(student_id: 4, course_id: 1)
Enrollment.create(student_id: 5, course_id: 1)
Enrollment.create(student_id: 6, course_id: 1)
Enrollment.create(student_id: 7, course_id: 1)
Enrollment.create(student_id: 8, course_id: 1)
Enrollment.create(student_id: 9, course_id: 1)
Enrollment.create(student_id: 10, course_id: 1)
Enrollment.create(student_id: 12, course_id: 1)
Enrollment.create(student_id: 13, course_id: 1)
Enrollment.create(student_id: 14, course_id: 1)
Enrollment.create(student_id: 11, course_id: 1)
Enrollment.create(student_id: 15, course_id: 1)
Enrollment.create(student_id: 16, course_id: 1)
Enrollment.create(student_id: 17, course_id: 1)
Enrollment.create(student_id: 18, course_id: 1)
Enrollment.create(student_id: 19, course_id: 1)
Enrollment.create(student_id: 20, course_id: 1)
Enrollment.create(student_id: 21, course_id: 1)
Enrollment.create(student_id: 22, course_id: 1)
Enrollment.create(student_id: 23, course_id: 1)
Enrollment.create(student_id: 24, course_id: 1)
Enrollment.create(student_id: 25, course_id: 1)
Enrollment.create(student_id: 26, course_id: 1)
Enrollment.create(student_id: 27, course_id: 1)
Enrollment.create(student_id: 28, course_id: 1)
Enrollment.create(student_id: 29, course_id: 1)
Enrollment.create(student_id: 30, course_id: 1)
Enrollment.create(student_id: 31, course_id: 1)
Enrollment.create(student_id: 32, course_id: 1)
Enrollment.create(student_id: 33, course_id: 1)
Enrollment.create(student_id: 34, course_id: 1)
Enrollment.create(student_id: 35, course_id: 1)
Enrollment.create(student_id: 36, course_id: 1)
Enrollment.create(student_id: 37, course_id: 1)
Enrollment.create(student_id: 38, course_id: 1)
Enrollment.create(student_id: 39, course_id: 1)
Enrollment.create(student_id: 40, course_id: 1)
Enrollment.create(student_id: 41, course_id: 1)
Enrollment.create(student_id: 42, course_id: 1)
Enrollment.create(student_id: 43, course_id: 1)
Enrollment.create(student_id: 44, course_id: 1)
