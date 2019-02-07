require_relative('../models/student')
require_relative('../models/house')
require('pry')

house_1 = House.new({
  'name' => 'Gryffindor',
  'logo' => './gryffindor.gif'
  })

house_2 = House.new({
  'name' => 'Hufflepuff',
  'logo' => './hufflepuff.gif'
  })

house_3 = House.new({
  'name' => 'Ravenclaw',
  'logo' => './ravenclaw.gif'
  })


house_4 = House.new({
  'name' => 'Slytherin',
  'logo' => './slytherin.gif'
  })

house_1.save
house_2.save
house_3.save
house_4.save


student_1 = Student.new({
  "first_name" => "David",
  "last_name" => "Hasselhoff",
  "house_id" => house_1.id,
  "age" => 1000
  })

student_2 = Student.new({
  "first_name" => "Steve",
  "last_name" => "Jobs",
  "house_id" => house_2.id,
  "age" => 12
  })

student_3 = Student.new({
  "first_name" => "Matt",
  "last_name" => "Woodley",
  "house_id" => house_3.id,
  "age" => 47
  })

student_4 = Student.new({
  "first_name" => "John",
  "last_name" => "Connor",
  "house_id" => house_4.id,
  "age" => 35
  })

student_1.save()
student_2.save()
student_3.save()
student_4.save()
binding.pry
nil
