# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@developer_1 = Developer.create(email: "dev_1@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Richard", last_name: "Hendriks")
@developer_2 = Developer.create(email: "dev_2@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Erlich", last_name: "Bachmann")
@developer_3 = Developer.create(email: "dev_3@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Dinesh", last_name: "Chugtai")
@developer_4 = Developer.create(email: "dev_4@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Bertram", last_name: "Gilfoyle")
@developer_5 = Developer.create(email: "dev_5@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Big", last_name: "Head")
@developer_6 = Developer.create(email: "dev_6@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Jian", last_name: "Yang")
@developer_7 = Developer.create(email: "dev_7@dev.com", password_hash: BCrypt::Password.create("password"), first_name: "Jared", last_name: "Dunn")

@project_1 = Project.create(name: "Intern Interviews", max_allowed_hours: 5)
@project_2 = Project.create(name: "Upgrade servers", max_allowed_hours: 30)
@project_3 = Project.create(name: "Marketing Strategy", max_allowed_hours: 20)

TimeEntry.create(subject: "Interview 1", duration: 1, project_id: @project_1.id, developer_id: @developer_1.id)
TimeEntry.create(subject: "Interview 2", duration: 1, project_id: @project_1.id, developer_id: @developer_7.id)
TimeEntry.create(subject: "Interview 3", duration: 0.5, project_id: @project_1.id, developer_id: @developer_2.id)
TimeEntry.create(subject: "Interview 4", duration: 1, project_id: @project_1.id, developer_id: @developer_1.id)
TimeEntry.create(subject: "Interview 5", duration: 1, project_id: @project_1.id, developer_id: @developer_7.id)

TimeEntry.create(subject: "Clean out garage", duration: 5, project_id: @project_2.id, developer_id: @developer_4.id)
TimeEntry.create(subject: "Throw away Jared's stuff", duration: 0.5, project_id: @project_2.id, developer_id: @developer_4.id)
TimeEntry.create(subject: "Order hardware", duration: 2, project_id: @project_2.id, developer_id: @developer_4.id)
TimeEntry.create(subject: "Install hardware", duration: 12, project_id: @project_2.id, developer_id: @developer_4.id)
TimeEntry.create(subject: "Install hardware", duration: 12, project_id: @project_2.id, developer_id: @developer_1.id)

TimeEntry.create(subject: "Order more Homicide energy drinks", duration: 0.5, project_id: @project_3.id, developer_id: @developer_2.id)
TimeEntry.create(subject: "Budgeting paperwork", duration: 2, project_id: @project_3.id, developer_id: @developer_7.id)
TimeEntry.create(subject: "Verify latest tests", duration: 10, project_id: @project_3.id, developer_id: @developer_3.id)
TimeEntry.create(subject: "Order swag", duration: 1, project_id: @project_3.id, developer_id: @developer_5.id)
TimeEntry.create(subject: "Meet with marketing consultants", duration: 2, project_id: @project_3.id, developer_id: @developer_1.id)
