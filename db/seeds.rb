# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Animal.create([
  { name: 'Lassie', animal_type: 'Dog', sex: 'Female', user_id: 1 }, 
  { name: 'Fido', animal_type: 'Dog', sex: 'Male', user_id: 1 }, 
  { name: 'Snoopy', animal_type: 'Dog', sex: 'Male', user_id: 1 }, 
  { name: 'Garfield', animal_type: 'Cat', sex: 'Male', user_id: 1 }, 
  { name: 'Scotty', animal_type: 'Dog', sex: 'Male', user_id: 1 }, 
  { name: 'Teddy', animal_type: 'Dog', sex: 'Male', user_id: 1 }, 
  { name: 'Fluffy', animal_type: 'Fish', sex: 'Female', user_id: 1 }, 
  { name: 'Grumpy Cat', animal_type: 'Cat', sex: 'Female', user_id: 1 }, 
  { name: 'Lil Bub', animal_type: 'Cat', sex: 'Female', user_id: 1 }, 
  { name: 'Lucky', animal_type: 'Dog', sex: 'Male', user_id: 1 }, 
])