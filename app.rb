require('sinatra')
require('sinatra/contrib/all')


get '/' do 
  erb(:index, :layout => :no_nav)
end

get '' do
  redirect '/'
end
