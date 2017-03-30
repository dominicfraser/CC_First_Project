require_relative('../db/sql_runner')

class Burrito

  attr_reader :id, :burrito_name

  def initialize(burrito_hash)
    @id = burrito_hash['id'].to_i
    @burrito_name = burrito_hash['burrito_name']
  end

end