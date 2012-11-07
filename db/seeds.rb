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

20.times do |t|
  Section.create(course_id: rand(5) + 1,
                 section_number: rand(10),
                 semester_id: rand(3) + 1)
end

################### UserSection #########################

user_size = User.all.size
section_size = Section.all.size

24.times do |u|
  20.times do |s|
    user_random = rand(user_size) + 1
    section_random = rand(section_size) + 1
    grade_random = rand(101)
    UserSection.create(user_id: user_random, section_id: section_random, grade: grade_random)
  end
end

################### Course #########################

5.times do |t|
  Course.create(name: "ITEC1#{t.to_s}01")
end

################### Category #########################

10.times do |t|
  Category.create(weight: (rand(26)*rand()),
                  name: "Chapter #{t.to_s}",
                  user_id: rand(user_size) + 1)
end

category_size = Category.all.size

################### Event #########################

50.times do |t|
  rand_time = rand(86400)
  Event.create(title: "Event #{t.to_s}",
               start: Time.now + rand_time,
               end: Time.now + 3600 + rand_time,
               category_id: rand(category_size) + 1,
               description: "",
               attachment: "")
end

################### SectionEvent #########################

20.times do |s|
  50.times do |e|
    SectionEvent.create(section_id: s,
                        event_id: e)
  end
end

################### CalendarPreferences ########################

100.times do |t|
  CalendarPreferences.create(user_id: rand(user_size) + 1,
                             grades_shown: true)
end

################### Gradebook #########################

24.times do |u|
  4.times do |s|
    50.times do |e|
      user_random = rand(user_size) + 1
      Gradebook.create(user_id: user_random,
                       section_id: s,
                       event_id: e)
    end
  end
end

################### Grade #########################

4800.times do |t|
  Grade.create(gradebook_id: t,
               grade: rand(101),
               file: "")
end

################### ProfessorEvent #########################

2.times do |u|
  20.times do |e|
    5.times do |c|
      ProfessorEvent.create(user_id: u,
                            event_id: e,
                            course_id: c)
    end
  end
end

################### Question #########################

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the first question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the second question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the third question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the fourth question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the fifth question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the sixth question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the seventh question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the eighth question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the ninth question?")

Question.create(event_id: nil,
                type: 0,
                description: "What is the answer to the tenth question?")

################### MultipleChoice #########################

10.times do |t|
  MultipleChoice.create(question_id: t,
                        answer: rand(4),
                        choice_1: "It might be this...",
                        choice_2: "Or this...",
                        choice_3: "Try this one!",
                        choice_4: "Or this one!")
end

################### UserResponse #########################

100.times do |u|
  10.times do |r|
    UserResponse.create(multiple_choice_id: r,
                        user_id: u,
                        user_response: rand(4))
  end
end