class RacecarsController < ApplicationController

    get '/racecars' do
        if logged_in?
            @racecars = Racecar.all
            erb :'racecars/index'
        else
            flash[:error] = "Please Log In to Continue"
            redirect '/login'
        end
    end

    get '/racecars/new' do
        if logged_in?
            erb :'racecars/new'
        else
            flash[:error] = "Please Log In to Continue"
            redirect '/login'
        end
    end

    post '/racecars' do
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
            flash[:error] = "Please Log In to Continue"
            redirect '/login'
        end
    end

    get '/racecars/:id' do
        if logged_in?
            @racecar = Racecar.find_by_id(params[:id])
            erb :'racecars/show'
        else
            flash[:error] = "Please Log In to Continue"
            redirect '/login'
        end
    end

    get '/racecars/:id/edit' do
        if logged_in?
            @racecar = Racecar.find_by_id(params[:id])
                if @racecar.user_id == current_user.id
                    erb :'racecars/edit'
                else
                    flash[:error] = "You can only edit racecars that you own!"
                    redirect '/users'
                end
        else
            flash[:error] = "Please Log In to Continue"
            redirect '/login'
        end
    end

    patch '/racecars/:id' do
        @racecar = Racecar.find_by_id(params[:id])
        @racecar.car_name = params[:car_name]
        @racecar.driver = params[:driver]
        @racecar.driver_bio = params[:driver_bio]
        if @racecar.save
            redirect "/racecars/#{@racecar.id}"
        end
        redirect "/racecars/#{params[:id]}/edit"
    end

    delete '/racecars/:id/delete' do
        if logged_in?
            @racecar = Racecar.find_by_id(params[:id])
            if @racecar && @racecar.user == current_user
                @racecar.delete
            else
                flash[:error] = "You can only delete racecars that you own!"
            end
            redirect '/users'
        else
            flash[:error] = "Please Log In to Continue"
            redirect '/login'
        end
    end
end