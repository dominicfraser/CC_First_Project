require_relative('../db/sql_runner')

class FoodCategory 

  attr_reader :id, :category

  def initialize(cat_hash)
    @id = cat_hash['id'].to_i
    @category = cat_hash['category']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO food_categories (category) VALUES ('#{@category}') RETURNING id"
    cat_pg = SqlRunner.run(sql)
    @id = cat_pg.first['id'].to_i
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM food_categories"
    cat_pgs = SqlRunner.run(sql)
    cat_obs = cat_pgs.map{|cat| FoodCategory.new(cat)}
    return cat_obs
  end

end