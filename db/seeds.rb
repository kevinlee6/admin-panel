require 'faker'

Course.create(
  name: 'Biology',
  class_hours: 6
)
Course.create(
  name: 'Chemistry',
  class_hours: 6
)
Course.create(
  name: 'Math',
  class_hours: 6
)
Course.create(
  name: 'English',
  class_hours: 6
)
Course.create(
  name: 'History',
  class_hours: 6
)

5.times do |i|
  Cohort.create(
    name: 'YEAR1',
    start_date: Time.now.to_date,
    end_date: Time.now.to_date,
    course_id: i + 1
  )
end

Cohort.create(
  name: 'YEAR2',
  start_date: Time.now.to_date,
  end_date: Time.now.to_date,
  course_id: 1
)

20.times do
  Instructor.create(
    first_name: Faker::Name.last_name,
    last_name: Faker::Name.first_name,
    age: rand(18...150),
    salary: rand(5..15) * 10000,
    education: Instructor.education.sample,
    cohort_id: rand(1...Cohort.all.length)
  )
end

100.times do |i|
  Student.create(
    first_name: Faker::Name.last_name,
    last_name: Faker::Name.first_name,
    age: rand(18...150)
  )
  CohortStudent.create(
    student_id: i + 1,
    cohort_id: rand(1..Cohort.all.length)
  )
end