require_relative('../models/deal')
require_relative('../models/burrito')
require_relative('../models/eatery')
require_relative('../models/day')

get '/deals/:id/:eid/:did' do
@deal = Deal.find(params[:id])
@eatery = Eatery.find(params[:eid])
@day = Day.find(params[:did])
@burritos = @deal.burritos_applies_to(@eatery, @day)
erb(:'deals/show_burritos')
end

