require_relative('../models/day')
require_relative('../models/eatery')
require_relative('../models/burrito')
require_relative('../models/menu_item')
require_relative('../models/deal')
require_relative('../models/food_category')

require('pry-byebug')

### MUST BE FIRST SEEDED
all_week = Day.new({
  'day_name' => 'All Days'
  })
all_week.save

all_eateries = Eatery.new({
  'eatery_name' => 'All Eateries',
  })
all_eateries.save

all_categories = FoodCategory.new({
  'category' => 'All'
  })
all_categories.save
###

classic = FoodCategory.new({
  'category' => 'Classic'
  })
classic_plus = FoodCategory.new({
  'category' => 'Classic Plus'
  })
deluxe = FoodCategory.new({
  'category' => 'Deluxe'
  })
special = FoodCategory.new({
  'category' => 'Special'
  })
classic.save
classic_plus.save
deluxe.save
special.save

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
new_years_eve_2017 = Day.new({
  'day_name' => 'NYE 2017'
  })

monday.save
tuesday.save
wednesday.save
thursday.save
friday.save
saturday.save
sunday.save
new_years_eve_2017.save

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
  'burrito_name' => 'burrito1',
  'burrito_cat' => classic.id
  })
burrito2 = Burrito.new({
  'burrito_name' => 'burrito2',
  'burrito_cat' => classic.id
  })
burrito3 = Burrito.new({
  'burrito_name' => 'burrito3',
  'burrito_cat' => classic.id
  })
burrito4 = Burrito.new({
  'burrito_name' => 'burrito4',
  'burrito_cat' => classic_plus.id
  })
burrito5 = Burrito.new({
  'burrito_name' => 'burrito5',
  'burrito_cat' => classic_plus.id
  })
burrito6 = Burrito.new({
  'burrito_name' => 'burrito6',
  'burrito_cat' => classic_plus.id
  })
burrito7 = Burrito.new({
  'burrito_name' => 'burrito7',
  'burrito_cat' => deluxe.id
  })
burrito8 = Burrito.new({
  'burrito_name' => 'burrito8',
  'burrito_cat' => deluxe.id
  })
burrito9 = Burrito.new({
  'burrito_name' => 'burrito9',
  'burrito_cat' => deluxe.id
  })
burrito10 = Burrito.new({
  'burrito_name' => 'burrito10',
  'burrito_cat' => special.id
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
  Eatery.all_without_first.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 7.5
    }).save
  }
}
expensive_core_burritos.each{|burrito| 
  Eatery.all_without_first.each{ |eatery|
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
eatery1.create_deal_for_category(monday,'20% off all Burritos at Eatery1 on Mondays',all_categories,'*','0.8')
#Eatery2 Wednesday 10% 
eatery2.create_deal_for_category(wednesday,'10% off all Burritos at Eatery2 on Wednesdays',all_categories,'*','0.9')
#Eatery3 Friday 15%
eatery3.create_deal_for_category(friday,'15% off all Burritos at Eatery3 on Fridays',all_categories,'*','0.85')
#Eatery1 Thursday £1 
eatery1.create_deal_for_category(thursday,'£1 off all Burritos at Eatery1 on Thursdays',all_categories,'1','-')
#Eatery2 Sunday 50p
eatery2.create_deal_for_category(sunday,'50p off all Burritos at Eatery2 on Sundays',all_categories,'0.5','-')
#Eatery3 Tuesday £1.50 
eatery3.create_deal_for_category(tuesday,'£1.50 off all Burritos at Eatery3 on Tuesdays',all_categories,'1.5','-')
#Eatery1 Tuesday 2for1
eatery1.create_deal_for_category(tuesday,'2 for 1 on all Burritos at Eatery1 on Tuesdays',all_categories,'0','special')

##selection of burritos at a certain eatery on a certain day##
#Eatery2 Thursday CP same as C
eatery2.create_deal_for_category(thursday,'Classic Plus same price as Classic at Eatery2 on Thursdays',classic_plus'0','special')

#Eatery3 Monday specials are reduced by £1   
eatery3.create_deal_for_category(monday,'Specials are all reduced by £1 at Eatery3 on Mondays',special,'1','-')

binding.pry
nil