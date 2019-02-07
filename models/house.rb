require_relative('../db/sqlrunner.rb')

class House

  attr_accessor :name,:logo
  attr_reader :id

  def initialize(house)
    @id = house['id'.to_i] if house['id']
    @name = house['name']
    @logo = house['logo']
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1,$2) RETURNING id"
    values = [@name,@logo]
    house_data = SqlRunner.run(sql,values)
    @id = house_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map { |house| House.new(house)}
    return result
  end
  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = House.new(house.first)
    return result
  end

end
