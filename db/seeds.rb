require 'faker'
admin = Admin.create!(
  first_name: 'Kevin',
  last_name: 'Lee'
)

admin.user = User.create!(
  email: 'kevin.lee@gmail.com',
  password: 'password'
)

admin.user.add_role :admin

Course.create!(
  name: 'Biology',
  class_hours: 6
)
Course.create!(
  name: 'Chemistry',
  class_hours: 6
)
Course.create!(
  name: 'Math',
  class_hours: 6
)
Course.create!(
  name: 'English',
  class_hours: 6
)
Course.create!(
  name: 'History',
  class_hours: 6
)

5.times do |i|
  Cohort.create!(
    name: "#{Course.find(i + 1).name[0..2].upcase}101",
    start_date: Time.now.to_date,
    end_date: Time.now.to_date,
    course_id: i + 1
  )

  instructor = Instructor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..88),
    salary: rand(5..15) * 10000,
    education: Instructor.education.sample,
    cohort_id: i + 1
  )

  instructor.user = User.create!(
    email: instructor.first_name[0] +
        instructor.last_name +
        instructor.id.to_s +
        '@school.edu',
    password: 'password'
  )

  instructor.user.add_role :instructor
end

Cohort.create!(
  name: 'BIO201',
  start_date: Time.now.to_date,
  end_date: Time.now.to_date,
  course_id: 1
)

100.times do |i|
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..88)
  )
  CohortStudent.create!(
    student_id: i + 1,
    cohort_id: rand(1..Cohort.all.length)
  )
  student.user = User.create!(
    email: student.first_name[0] +
         student.last_name +
         student.id.to_s +
         '@school.edu',
    password: 'password'
  )

  student.user.add_role :student
end