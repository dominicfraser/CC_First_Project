require_relative('../models/day')
require('pry-byebug')

monday = Day.new({
  'day_name' => 'Monday'
  })

monday.save