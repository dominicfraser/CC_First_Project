 require('minitest/autorun')
 require('minitest/rg')
 require_relative('../models/menu_item')
 require_relative('../models/burrito')

class TestMenuItem < MiniTest::Test

def setup
  @sofritas = Burrito.new({
    'burrito_name' => 'breakfast',
    'id' => 1
    })
  @breakfast = Burrito.new({
    'burrito_name' => 'breakfast',
    'id' => 6
    })
  @spicy_guiso = Burrito.new({
    'burrito_name' => 'spicy_guiso',
    'id' => 7
    })
  @juarez = Burrito.new({
    'burrito_name' => 'juarez',
    'id' => 8
    })
  @expensive_core_burritos = [@breakfast,@spicy_guiso,@juarez]
  @menu_item1 = MenuItem.new({
    'eatery_id' => 1,
    'burrito_id' => @spicy_guiso.id,
    'price' => 9,
    'id' => 1
    })
  @menu_item2 = MenuItem.new({
    'eatery_id' => 1,
    'burrito_id' => @sofritas.id,
    'price' => 9,
    'id' => 1
    })
end

def test_menu_item_is_in_a_selection?
    assert_equal(true,@menu_item1.is_in_a_selection?(@expensive_core_burritos))
end

def test_menu_item_is_in_a_selection_false?
    assert_equal(false,@menu_item2.is_in_a_selection?(@expensive_core_burritos))
end

end