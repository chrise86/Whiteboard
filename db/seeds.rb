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
  User.create(first_name: "Test #{t.to_s}",
              last_name: "User#{t.to_s}",
              email: "tuser#{t.to_s}@atestuser.com",
              password: "secretpassword#{t.to_s}",
              role: 1)
end

################### Course #########################

3.times do |t|
  5.times do |u|
    Course.create(name: "ITEC#{(t+1).to_s}#{u.to_s}01")
  end
end

course_size = Course.all.size

################### Section #########################

course_size.times do |course|
  5.times do |section|
    Section.create(course_id: course + 1,
                   section_number: section + 1,
                   semester_id: rand(3) + 1)
  end
end

################### UserSection #########################

user_size = User.all.size

user_size.times do |u|
  courses = Course.all.sample(4)
  courses.each do |c|
    sections = Section.where(:course_id => c.id)
    grade_random = rand(101)
    UserSection.create(user_id: (u+1), section_id: sections.sample().id, grade: grade_random)
  end
end

################### Category #########################

2.times do |t|
  Category.create(weight: 25.00,
                  name: "Test",
                  user_id: t)

  Category.create(weight: 15.00,
                  name: "Quiz",
                  user_id: t)

  Category.create(weight: 15.00,
                  name: "Assignment",
                  user_id: t)

  Category.create(weight: 45.00,
                  name: "Project",
                  user_id: t)
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