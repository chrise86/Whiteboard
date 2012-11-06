# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


################### User #########################

User.create(first_name: "Derek",
            last_name: "Cannon",
            email: "derek@derekcannon.com",
            password: "secret",
            role: 0)

User.create(first_name: "Ian",
            last_name: "Graham",
            email: "ian@iangraham.com",
            password: "another_secret",
            role: 0)

User.create(first_name: "Drew",
            last_name: "Stephenson",
            email: "drew@drewstephenson.com",
            password: "shhh_secret",
            role: 1)

User.create(first_name: "Ryan",
            last_name: "DeMaeyor",
            email: "ryan@ryandemaeyor.com",
            password: "last_secret",
            role: 1)

95.times do |t|
  User.create(first_name: "Test",
              last_name: "User#{t.to_s}",
              email: "tuser#{t.to_s}@atestuser.com",
              password: "secretpassword#{t.to_s}",
              role: 1)
end

################### Section #########################

Section.create(course_id: 0,
               section_number: 0,
               semester_id: 0,
               professor: "Richard Price")

Section.create(course_id: 1,
               section_number: 0,
               semester_id: 1,
               professor: "Michael Morton")

Section.create(course_id: 2,
               section_number: 0,
               semester_id: 2,
               professor: "Evelyn Brannock")

Section.create(course_id: 3,
               section_number: 0,
               semester_id: 1,
               professor: "Peter Meso")

Section.create(course_id: 4,
               section_number: 0,
               semester_id: 0,
               professor: "Mr. Anonymous")

15.times do |t|
  Section.create(course_id: rand(5),
                 section_number: rand(10),
                 semester_id: rand(3),
                 professor: "Dr. Professor #{t.to_s}")
end

################### UserSection #########################

user_size = User.all.size
section_size = Section.all.size

2000.times do |t|
  user_random = rand(user_size)
  section_random = rand(section_size)
  grade_random = random(101)
  UserSection.create(user_id: user_random, section_id: section_size, grade: grade_random)
end