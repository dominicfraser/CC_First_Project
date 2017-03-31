require('sinatra')
require('sinatra/contrib/all')


get '/' do 
  erb(:index)
end

get '' do
  redirect '/'
end
