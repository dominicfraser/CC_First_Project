require_relative('../models/deal')

get '/deals/:id' do

erb(:'deals/show')
end

