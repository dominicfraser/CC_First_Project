require_relative('../models/day')
require_relative('../models/eatery')
require_relative('../models/burrito')
require_relative('../models/menu_item')
require_relative('../models/deal')

require('pry-byebug')

monday = Day.new({
  'day_name' => 'Monday'
  })
tuesday = Day.new({
  'day_name' => 'Tuesday'
  })
wednesday = Day.new({
  'day_name' => 'Wednesday'
  })
thursday = Day.new({
  'day_name' => 'Thursday'
  })
friday = Day.new({
  'day_name' => 'Friday'
  })
saturday = Day.new({
  'day_name' => 'Saturday'
  })
sunday = Day.new({
  'day_name' => 'Sunday'
  })

monday.save
tuesday.save
wednesday.save
thursday.save
friday.save
saturday.save
sunday.save

eatery1 = Eatery.new({
  'eatery_name' => 'eatery1'
  })
eatery2 = Eatery.new({
  'eatery_name' => 'eatery2'
  })
eatery3 = Eatery.new({
  'eatery_name' => 'eatery3'
  })

eatery1.save
eatery2.save
eatery3.save

burrito1 = Burrito.new({
  'burrito_name' => 'burrito1'
  })
burrito2 = Burrito.new({
  'burrito_name' => 'burrito2'
  })
burrito3 = Burrito.new({
  'burrito_name' => 'burrito3'
  })
burrito4 = Burrito.new({
  'burrito_name' => 'burrito4'
  })
burrito5 = Burrito.new({
  'burrito_name' => 'burrito5'
  })
burrito6 = Burrito.new({
  'burrito_name' => 'burrito6'
  })
burrito7 = Burrito.new({
  'burrito_name' => 'burrito7'
  })
burrito8 = Burrito.new({
  'burrito_name' => 'burrito8'
  })
burrito9 = Burrito.new({
  'burrito_name' => 'burrito9'
  })
burrito10 = Burrito.new({
  'burrito_name' => 'burrito10'
  })

burrito1.save
burrito2.save
burrito3.save
burrito4.save
burrito5.save
burrito6.save
burrito7.save
burrito8.save
burrito9.save
burrito10.save

cheap_core_burritos = [burrito1,burrito2,burrito3]
expensive_core_burritos = [burrito4,burrito5,burrito6]


cheap_core_burritos.each{|burrito| 
  Eatery.all.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 7.5
    }).save
  }
}
expensive_core_burritos.each{|burrito| 
  Eatery.all.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 8
    }).save
  }
}

menu_item1 = MenuItem.new({
  'eatery_id' => eatery1.id,
  'burrito_id' => burrito7.id,
  'price' => 9
  })
menu_item2 = MenuItem.new({
  'eatery_id' => eatery1.id,
  'burrito_id' => burrito8.id,
  'price' => 9
  })
menu_item3 = MenuItem.new({
  'eatery_id' => eatery2.id,
  'burrito_id' => burrito9.id,
  'price' => 9
  })
menu_item4 = MenuItem.new({
  'eatery_id' => eatery3.id,
  'burrito_id' => burrito10.id,
  'price' => 10
  })
menu_item1.save
menu_item2.save
menu_item3.save
menu_item4.save

##all burritos at a certain eatery on a certain day##
#Eatery1 Monday 20% 
MenuItem.find(eatery1.id).each{|mi| 
  mi.create_deal(monday.id,'20% off all Burritos at Eatery1 on Mondays').save}
#Eatery2 Wednesday 10% 
MenuItem.find(eatery2.id).each{|mi|
mi.create_deal(wednesday.id,'10% off all Burritos at Eatery2 on Wednesdays').save}
#Eatery3 Friday 15%
MenuItem.find(eatery3.id).each{|mi|
mi.create_deal(friday.id,'15% off all Burritos at Eatery3 on Fridays').save}
#Eatery1 Thursday £1 
MenuItem.find(eatery1.id).each{|mi|
mi.create_deal(thursday.id,'£1 off all Burritos at Eatery1 on Thursdays')}
#Eatery2 Sunday 50p
MenuItem.find(eatery2.id).each{|mi|
mi.create_deal(sunday.id,'50p off all Burritos at Eatery2 on Sundays').save}
#Eatery3 Tuesday £1.50 
MenuItem.find(eatery3.id).each{|mi|
mi.create_deal(tuesday.id,'£1.50 off all Burritos at Eatery3 on Tuesdays').save}
#Eatery1 Tuesday 2for1
MenuItem.find(eatery1.id).each{|mi| 
  mi.create_deal(monday.id,'2 for 1 on all Burritos at Eatery1 on Tuesdays').save}
#Eatery2


binding.pry
nil