# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# usuarios #

admin = User.create!(
    name:"admin",
    apellido:"admin",
    nacimiento:'12/03/1990',
    email:"admin@admin.com",
    premium: true,
    admin: true,
    password: "administrador",
    password_confirmation: "administrador",
    direccion: "casa",
    telefono: "casa",
    )
