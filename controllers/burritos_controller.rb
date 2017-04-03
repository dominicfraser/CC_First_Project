require_relative('../models/burrito')
require_relative('../models/eatery')

get '/burritos/index' do
  @burritos = Burrito.all
  erb(:'burritos/index')
end