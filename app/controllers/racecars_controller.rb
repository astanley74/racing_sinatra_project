class RacecarsController < ApplicationController

    get '/racecars' do
        #if not logged in
            #redirect to login page
        #else
            #render users racecars
        #end
        if logged_in?
            @racecars = Racecar.all
            erb :'racecars/index'
        else
            redirect '/login'
        end
    end

    get '/racecars/new' do
        #if user is logged in
            #render racecars/new
         #else
            #redirect to login page
        #end
        if logged_in?
            erb :'racecars/new'
        else
            redirect '/login'
        end
    end

    post '/racecars' do
        #create racecar and then redirect to page to show user's racecars
        #if user is logged in
            #if params[:car_name] == "" || params[:number] == "" || params[:driver] == "" || params[:driver_bio] == ""
                #create racecar and redirect to users page where all racecars are listed
            #else
                #redirect to '/racecars/new'
            #end
        #else
            #redirect to login
        #end
        
        if logged_in?
            if params[:car_name] == "" || params[:number] == "" || params[:driver] == "" || params[:driver_bio] == ""
                redirect '/racecars/new'
            else
                @racecar = current_user.racecars.new(:car_name => params[:car_name], :number => params[:number], :driver => params[:driver], :driver_bio => params[:driver_bio])
                if @racecar.save
                    redirect "/racecars/#{@racecar.id}"
                else
                    redirect to '/racecars/new'
                end
            end
        else
            redirect '/login'
        end
    end

    get '/racecars/:id' do
        #if logged in
            #find racecar by params[:id]
            #render show page for racecar
        #else
            #redirect to login
        #end
        if logged_in?
            @racecar = Racecar.find_by_id(params[:id])
            erb :'racecars/show'
        else
            redirect '/login'
        end
    end



end