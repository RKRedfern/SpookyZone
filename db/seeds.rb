# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([{username: 'Riley', email:'Riley@gmail.com', password: 'test'}, {username: 'Don', email:'Don@gmail.com', password: 'test'}, {username: 'Allison', email:'Allison@gmail.com', password: 'test'}, {username: 'Jon', email:'Jon@gmail.com', password: 'test'}])

Story.create([{ user_id: 1, title: 'Slender Man', content: 'You know this one...'}, {user_id:2, title:'Ted The Caver', content:"Basically this guy tries to get into an undiscovered cave and barely makes it out alive... without giving it all away."}, {user_id: 2, title:'SuicideMouse.Avi', content:'REDACTED'},  {user_id: 2, title:'Smile Mouth', content:'Cover your mirrors at night'},  {user_id: 3, title:'No End House', content:'Let me start by saying that Peter Terry was addicted to heroin...'},  {user_id: 3, title:'Rugrats Theory', content:'Original Version The Rugrats really were a figment of Angelicas demonic and unimaginable imagination.'}])
