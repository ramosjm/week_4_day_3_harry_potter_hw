require("sinatra")
require("sinatra/contrib/all")
require("pry")

require_relative("./models/student")
require_relative("./models/house")
also_reload("./models/*")

get "/hogwarts-students" do
  @students = Student.all()
  erb(:index)
end

get "/hogwarts-students/new" do
  erb(:new)
end

post "/hogwarts-students" do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end
