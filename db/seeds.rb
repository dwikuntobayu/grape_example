# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'dwikuntobayu', password: '12345678')

Bycycle.create([
  {name: 'Recon 1', series: 'Xc-rc 1'},
  {name: 'Recon 2', series: 'Xc-rc 2'},
  {name: 'Recon 3', series: 'Xc-rc 3'},
  {name: 'Recon 4', series: 'Xc-rc 4'},
  {name: 'Recon 5', series: 'Xc-rc 5'}
])
