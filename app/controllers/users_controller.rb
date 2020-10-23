class UsersController < ApplicationController

    get '/users' do
        if logged_in?
            @user = current_user.racecars
            erb :'users/show'
        else
            redirect '/'
        end
    end

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect '/users'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == "" || params[:team_name] == "" || params[:manufacturer] == ""
            redirect '/signup'
        else
            @user = User.new(:username => params[:username], :password => params[:password], :team_name => params[:team_name], :manufacturer => params[:manufacturer])
            @user.save
            session[:user_id] = @user.id
            redirect '/users'
        end
    end


    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect '/users'
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/users'
        else
            redirect '/signup'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end