# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Project.create({ name: 'Personal Web Development', description: 'Personal Blog/web catalog to show with CV and additional projects' })

# Project.first.entries.create({ project_id: 2,
# 															 hours: 2,
# 															 minutes: 30,
# 															 comments: 'Seed generated entry',
# 															 date: Date.today })

Project.all.each do |project|
	project.entries.create({ project_id: project.id,
													 hours: 0,
													 minutes: 30,
													 comments: 'One entry for every project',
													 date: DateTime.now })
end