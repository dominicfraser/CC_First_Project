require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/deals_controller')

get '/' do 
  erb(:log_on, :layout => :no_nav)
end

get '' do
  redirect '/'
end

get '/deal_selection/filter' do
  erb(:'deal_selection/filter')
end