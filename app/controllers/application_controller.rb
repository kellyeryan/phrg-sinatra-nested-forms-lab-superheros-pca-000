require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get "/" do

      erb :super_hero
    end

    post "/" do

      @team_name = params[:team][:name]
      @team_motto = params[:team][:motto]
      @members = params[:team][:members]
      @hero_name = []
      @hero_power = []
      @hero_bio = []
      @members.each do |h|
        @hero_name << h[:name]
        @hero_power << h[:power]
        @hero_bio << h[:bio]
      end

      erb :team
    end
end
