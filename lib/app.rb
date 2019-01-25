require 'sinatra/base'
require_relative 'birthday_calculator'

class BirthdayApp < Sinatra::Base

  enable :sessions

  set :session_secret, "secret"

  get '/' do
    erb(:index)
  end

  post '/' do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    redirect '/birthday_calculator'
  end

  get '/birthday_calculator' do
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]
    @days_away = Birthday_calculator.new(@day, @month).birthday_calc
    if @days_away == 0
      erb(:happy_birthday)
    else
      erb(:birthday_calculator)
    end
  end

end
