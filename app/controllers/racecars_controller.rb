class RacecarsController < ApplicationController

    get '/racecars' do
        #if not logged in
            #redirect to login page
        #else
            #render users racecars
        #end
    end

    get '/racecars/new' do
        #if user is logged in
            erb :'racecars/new'
        #else
            #redirect to login page
        #end
    end

    post '/racecars' do
        #create racecar and then redirect to page to show user's racecars
        #if user is logged in
            #if params[:car_name] == "" || params[:number] == "" || params[:driver] == "" || params[:driver_bio] == ""
                #create racecar and redirect to users page where all racecars are listed
                @racecar = Racecar.create(:car_name => params[:car_name], :number => params[:number], :driver => params[:driver], :driver_bio => params[:driver_bio])
                erb :'racecars/show'
            #else
                #redirect to '/racecars/new'
            #end
        #else
            #redirect to login
        #end
    end



end