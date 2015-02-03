# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Project.create({ name: 'Personal Web Development', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development1', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development2', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development3', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development4', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development5', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development6', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development7', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development8', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development9', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development10', description: 'Personal Blog/web catalog to show with CV and additional projects' })
# Project.create({ name: 'Personal Web Development11', description: 'Personal Blog/web catalog to show with CV and additional projects' })

Project.first.entries.create({ project_id: 2,
															 hours: 2,
															 minutes: 30,
															 comments: 'Seed generated entry',
															 date: Date.today })