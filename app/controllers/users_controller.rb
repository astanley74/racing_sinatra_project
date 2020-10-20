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
            #create a user who has username, password, team_name, and manufacturer from the signup form and save
            @user = User.create(:username => params[:username], :password => params[:password], :team_name => params[:team_name], :manufacturer => params[:manufacturer])
            binding.pry
            redirect '/users'
        #end
    end


    get '/login' do
        #if not logged in
            #erb :users/login
        #else
            #take user to their racecars page
        #end
    end

    post '/login' do

    end

    get '/logout' do
    end
end