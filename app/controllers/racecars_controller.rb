class RacecarsController < ApplicationController

    get '/racecars' do
        @racecars = Racecar.all
        #show all racecars
    end

    get '/racecars/new' do
        #route to form where racecar can be created
        erb :'racecars/new'
    end

    post '/racecars' do
        #create racecar and then redirect to page to show user's racecars
        @racecar = Racecar.create(:car_name => params[:car_name], :number => params[:number], :driver => params[:driver], :driver_bio => params[:driver_bio])
        erb :'racecars/show'
    end



end