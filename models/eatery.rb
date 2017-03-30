require_relative('../db/sql_runner')

class Eatery

  attr_reader :id, :eatery_name

  def initialize(eatery_hash)
    @id = eatery_hash['id'].to_i
    @eatery_name = eatery_hash['eatery_name']
  end

end