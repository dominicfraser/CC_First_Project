require_relative('../models/day')
require_relative('../models/eatery')
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

eatery1.save

binding.pry
nil