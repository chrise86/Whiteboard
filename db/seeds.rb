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
            role: 0)

User.create(first_name: "Ryan",
            last_name: "DeMaeyor",
            email: "ryan@ryandemaeyor.com",
            password: "last_secret",
            role: 1)

35.times do |t|
  User.create(first_name: "Test #{t.to_s}",
              last_name: "User #{t.to_s}",
              email: "tuser#{t.to_s}@atestuser.com",
              password: "secretpassword #{t.to_s}",
              role: 1)
end

################### Course #########################

2.times do |course_level|
  3.times do |course_type|
    Course.create(name: "ITEC#{course_level+1}#{course_type}#{rand(0..course_level+5)}0")
  end
end

################### Section #########################

days1 = '123456'.split ''
days2 = '12345'.split ''
day_combinations = days1.combination(1).to_a.push(*days2.combination(2).to_a).push(*days2.combination(3).to_a)
day_combinations.collect! {|meeting_days| meeting_days.join}

Course.all.each do |course|
  15.times do |section|
    Section.create(course_id: course.id,
                   section_number: section + 1,
                   semester_id: rand(2..7), # The semester ID needed updating to reflect the current year
                   meeting_days: day_combinations.sample)
  end
end

################### UserSection #########################

professors = User.where(:role => 0)
all_sections = Section.all
professors.each do |professor|
  all_sections.pop(30).each do |section|
    UserSection.create(user_id: professor.id, section_id: section.id)
  end
end

User.where(:role => 1).each do |user|
  courses = Course.all.sample([3,4].sample)
  courses.each do |course|
    sections = Section.where(:course_id => course.id)
    grade_random = rand(101)
    UserSection.create(user_id: user.id, section_id: sections.sample.id, grade: grade_random)
  end
end

################### Category #########################

professors.each do |professor|
  Category.create(weight: 25.00,
                  name: "Test",
                  user_id: professor.id)

  Category.create(weight: 15.00,
                  name: "Quiz",
                  user_id: professor.id)

  Category.create(weight: 15.00,
                  name: "Assignment",
                  user_id: professor.id)

  Category.create(weight: 45.00,
                  name: "Project",
                  user_id: professor.id)
end

################### Event #########################

50.times do |number|
  Event.create(title: "Event #{(number+1).to_s}",
               category_id: Category.all.sample.id,
               description: "",
               attachment: "")
end

################### ProfessorEvent #########################

professors.each do |professor|
  Course.all.each do |course|
    course_events = Event.all.sample(15)
    course_events.each do |event|
      ProfessorEvent.create(user_id: professor.id,
                            event_id: event.id,
                            course_id: course.id,
                            semester_id: rand(0..5))
    end
  end
end

################### SectionEvent #########################

Section.all.each do |section|
  section.professor_events.sample(7).each do |event|
    semester_start = section.semester_start.to_time
    semester_end = section.semester_end.to_time
    random_day = rand(semester_start..semester_end).beginning_of_week.to_date + (section.days.sample-1).days
    SectionEvent.create(section_id: section.id,
                        event_id: event.id,
                        start_date: random_day,
                        end_date: random_day + (1.hour + 15.minute))
  end
end

################### CalendarPreferences ########################

User.all.each do |user|
  CalendarPreferences.create(user_id: user.id,
                             grades_shown: [true, false].sample)
end

################### Gradebook #########################

User.where(:role => 1).each do |user|
  user.sections.each do |section|
    section.events.each do |event|
      Gradebook.create(user_id: user.id,
                       section_id: section.id,
                       event_id: event.id)
    end
  end
end

################### Grade #########################

Gradebook.all.each do |grade|
  Grade.create(gradebook_id: grade.id,
               grade: rand(101).to_f,
               file: "")
end

################### Question #########################

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the first question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the second question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the third question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the fourth question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the fifth question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the sixth question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the seventh question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the eighth question?")

Question.create(event_id: nil,
                category: 0,
                description: "What is the answer to the ninth question?")

Question.create(event_id: nil,
                category: 0,
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

User.where(:role => 1).each do |user|
  MultipleChoice.all.each do |multiple_choice|
    UserResponse.create(multiple_choice_id: multiple_choice.id,
                        user_id: user.id,
                        user_response: %W("", "0", "1", "2", "3").sample)
  end
end