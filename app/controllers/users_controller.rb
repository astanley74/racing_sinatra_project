class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'users/show'
    end

    get '/signup' do
        #if not logged in
        erb :'users/signup'

        #if user is logged in
        #redirect to users page with their racecars
    end

    post '/signup' do
        #if no username, password, team_name, or manufacturer
            #redirect to signup
        #else
            #create a user who has username, password, team_name, and manufacturer from the signup form and then login
            @user = User.create(:username => params[:username], :password => params[:password], :team_name => params[:team_name], :manufacturer => params[:manufacturer])
            # binding.pry
            redirect '/users'
        #end
    end


    get '/login' do
        erb :'users/login'
        #if not logged in
            #erb :users/login
        #else
            #take user to their racecars page
        #end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            #redirect to user homepage with all of their racecars
        else
            redirect '/signup'
        end
    end

    get '/logout' do
        #if user is logged in
            #session.clear and redirect to the login or signup page
        #else
            #redirect to the login page
        #end
    end
end