require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/deals_controller')
require_relative('models/day')
require_relative('models/eatery')

get '/' do 
  erb(:log_on, :layout => :no_nav)
end

get '' do
  redirect '/'
end

get '/deal_selection/filter' do
  @days = Day.all
  @eateries = Eatery.all
  erb(:'deal_selection/filter')
end