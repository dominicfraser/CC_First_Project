 require('minitest/autorun')
 require('minitest/rg')
 require_relative('../models/menu_item')
 require_relative('../models/burrito')
 require_relative('../models/eatery')

class TestBurrito < MiniTest::Test

  def setup
    @burrito1 = Burrito.new({
      'burrito_name' => 'burrito6',
      'id' => 1
      })
    @burrito2 = Burrito.new({
      'burrito_name' => 'burrito6',
      'id' => 2
      })
    @eatery1 = Eatery.new({
      'eatery_name' => 'eatery1',
      'id' => 1
      })
    @menu_item1 = MenuItem.new({
      'eatery_id' => @eatery1.id,
      'burrito_id' => @burrito1.id,
      'price' => 9,
      'id' => 1
      })
    @menu_item2 = MenuItem.new({
      'eatery_id' => @eatery1.id,
      'burrito_id' => @burrito2.id,
      'price' => 9,
      'id' => 2
      })

  end

end