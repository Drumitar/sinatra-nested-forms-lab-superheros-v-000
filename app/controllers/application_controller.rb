require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do

      @team = Team.new(params[:team])
      #@hero1 = Hero.new(name: params[:member1_name], power: params[:member1_power], bio: params[:member1_bio] )
      #@hero2 = Hero.new(name: params[:member2_name], power: params[:member2_power], bio: params[:member2_bio] )
      #@hero3 = Hero.new(name: params[:member3_name], power: params[:member3_power], bio: params[:member3_bio] )
      #binding.pry
      params[:team][:members].each do |hero|
        Hero.new(hero)
      end

      @heros = Hero.all


      #binding.pry

      erb :team
    end


end
