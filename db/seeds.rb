
3.times do
  name = ["english_101", "LithuanianLit_202", "Calculus_61", "Mrs-Stevensons-Pre-Kay"]
  user_id = (1..20).to_a
  Course.create(name: name.sample, user_id: user_id.sample)
end

100.times do
  grade = (40..99).to_a
  start_date = Time.new.strftime("%m-%d-%Y")
  due_date = ["12-08-2013", "11-20-2013", "12-23-13", "11-24-13", "01-12-14", "12-22-13", "12-20-13", "12-19-13"]

  Assignment.create(grade: grade.sample, start_date: start_date, due_date: due_date.sample )
end

100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  Student.create(first_name: first_name, last_name: last_name, course_id: [1,2,3].sample)
end


User.create(email: "rskelley9@gmail.com", password: "password")
User.create(email: "hoovs@hoovs.com", password: "password")
User.create(email: "magicmike@magicmike.com", password: "password")
User.create(email: "wolfman@wolfman.com", password: "password")

200.times do
  student_id = (1..100).to_a
  assignment_id = (1..100).to_a

  StudentAssignment.create(student_id: student_id.sample, assignment_id: assignment_id.sample)
end

  # create_table "assignments", :force => true do |t|
  #   t.integer  "grade"
  #   t.date     "start_date"
  #   t.date     "due_date"
  #   t.datetime "created_at", :null => false
  #   t.datetime "updated_at", :null => false
  # end

  # create_table "courses", :force => true do |t|
  #   t.string   "name"
  #   t.integer  "user_id"
  #   t.datetime "created_at", :null => false
  #   t.datetime "updated_at", :null => false
  # end

  # create_table "student_assignments", :force => true do |t|
  #   t.integer  "student_id"
  #   t.integer  "assignment_id"
  #   t.datetime "created_at",    :null => false
  #   t.datetime "updated_at",    :null => false
  # end

  # create_table "students", :force => true do |t|
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.integer  "course_id"
  #   t.datetime "created_at", :null => false
  #   t.datetime "updated_at", :null => false
  # end

  # create_table "users", :force => true do |t|
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.datetime "created_at",      :null => false
  #   t.datetime "updated_at",      :null => false
  # end

