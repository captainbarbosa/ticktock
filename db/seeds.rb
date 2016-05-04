# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@developer = Developer.create(email: "dev@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Devy", last_name: "McDev")
@project = Project.create(name: "Style app", max_allowed_hours: 10)
TimeEntry.create(subject: "Wireframing", start_time: "2016-05-04 09:00:00", end_time: "2016-05-04 12:00:00", project_id: @project.id, developer_id: @developer.id)
TimeEntry.create(subject: "HTML & CSS", start_time: "2016-05-04 13:00:00", end_time: "2016-05-04 14:00:00", project_id: @project.id, developer_id: @developer.id)
TimeEntry.create(subject: "JavaScript", start_time: "2016-05-04 14:15:00", end_time: "2016-05-04 17:00:00", project_id: @project.id, developer_id: @developer.id)
