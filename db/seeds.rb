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

################### Section #########################

Course.all.each do |course|
  5.times do |section|
    Section.create(course_id: course.id,
                   section_number: section + 1,
                   semester_id: [1,2,3].sample)
  end
end

################### UserSection #########################

User.all.each do |user|
  courses = Course.all.sample(4)
  courses.each do |course|
    sections = Section.where(:course_id => course.id)
    grade_random = rand(101)
    UserSection.create(user_id: user.id, section_id: sections.sample.id, grade: grade_random)
  end
end

################### Category #########################

2.times do |t|
  Category.create(weight: 25.00,
                  name: "Test",
                  user_id: t+1)

  Category.create(weight: 15.00,
                  name: "Quiz",
                  user_id: t+1)

  Category.create(weight: 15.00,
                  name: "Assignment",
                  user_id: t+1)

  Category.create(weight: 45.00,
                  name: "Project",
                  user_id: t+1)
end

################### Event #########################

50.times do |number|
  rand_time = rand(604800)
  Event.create(title: "Event #{(number+1).to_s}",
               start: Time.now + rand_time,
               end: Time.now + 4500 + rand_time,
               category_id: Category.all.sample.id,
               description: "",
               attachment: "")
end

################### SectionEvent #########################

Section.all.each do |section|
  Event.all.sample(35).each do |event|
    SectionEvent.create(section_id: section.id,
                        event_id: event.id)
  end
end

################### CalendarPreferences ########################

User.all.each do |user|
  CalendarPreferences.create(user_id: user.id,
                             grades_shown: [true, false].sample)
end

################### Gradebook #########################

random_users = User.all.sample(24)
random_users.each do |user|
  user_sections = Section.find_all_for_user(user.id)
  user_sections.each do |section|
    section_events = Event.find_all_for_section(section.id)
    section_events.each do |event|
      Gradebook.create(user_id: user.id,
                       section_id: section.id,
                       event_id: event.id)
    end
  end
end

################### Grade #########################

Gradebook.all.each do |grade|
  Grade.create(gradebook_id: grade.id,
               grade: rand(101),
               file: "")
end

################### ProfessorEvent #########################

2.times do |professor|
  Course.all.each do |course|
    Event.all.sample(20).each do |event|
      ProfessorEvent.create(user_id: professor+1,
                            event_id: event.id,
                            course_id: course.id)
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

Question.all.each do |question|
  MultipleChoice.create(question_id: question.id,
                        answer: rand(4),
                        choice_1: "It might be this...",
                        choice_2: "Or this...",
                        choice_3: "Try this one!",
                        choice_4: "Or this one!")
end

################### UserResponse #########################

User.all.each do |user|
  MultipleChoice.all.each do |multiple_choice|
    UserResponse.create(multiple_choice_id: multiple_choice.id,
                        user_id: user.id,
                        user_response: %W("", "0", "1", "2", "3").sample)
  end
end