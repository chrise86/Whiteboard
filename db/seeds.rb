# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Derek",
            last_name: "Cannon",
            email: "derek@derekcannon.com",
            password: "secret")

User.create(first_name: "Ian",
            last_name: "Graham",
            email: "ian@iangraham.com",
            password: "another_secret")

User.create(first_name: "Drew",
            last_name: "Stephenson",
            email: "drew@drewstephenson.com",
            password: "shhh_secret")

User.create(first_name: "Ryan",
            last_name: "DeMaeyor",
            email: "ryan@ryandemaeyor.com",
            password: "last_secret")

95.times do |t|
  User.create(first_name: "Test",
              last_name: "User#{t.to_s}",
              email: "tuser#{t.to_s}@atestuser.com",
              password: "secretpassword#{t.to_s}")
end
