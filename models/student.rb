require_relative('../db/sqlrunner')


class Student

attr_accessor :first_name, :last_name, :house_id, :age
attr_reader :id

  def initialize(students)
    @id = students['id'].to_i if students['id']
    @first_name = students['first_name']
    @last_name = students['last_name']
    @house_id = students['house_id'].to_i
    @age = students['age'].to_i
  end

  def find_house()
    sql = "SELECT houses.* FROM houses INNER JOIN students ON students.house_id = houses.id WHERE students.house_id = $1"
    values = [@house_id]
    house_data = SqlRunner.run(sql,values)
    result = House.new(house_data.first)
    return result

  end
  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

end
