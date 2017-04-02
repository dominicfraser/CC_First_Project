require_relative('../models/deal')
require_relative('../models/burrito')
require_relative('../models/eatery')
require_relative('../models/day')

get '/eateries/index' do
  @eateries = Eatery.all
  erb(:'eateries/index')
end