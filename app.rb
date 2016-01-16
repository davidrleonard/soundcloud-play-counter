require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/json"
require './config/environments' # database configuration
require './models/plays'

get '/' do
  @plays = Play.all
  @plays.each do |play|
    puts play.play_count
  end
  @last_play = Play.last(1)
  "Current play count: #{@last_play[0].play_count}"
end

get '/api/1/plays.json' do
  # Get play count for right now
  current_plays = Play.order(:created_at).last(1)
  current_count = current_plays[0].play_count

  # Get play count for 30 days ago
  thirty_days_ago_plays = Play.where(['created_at < ?',30.days.ago]).order(:created_at).last(1)
  thirty_days_ago_count = thirty_days_ago_plays[0].play_count

  json(
        :all_time_plays => {
           :today => current_count,
           :thirty_days_ago => thirty_days_ago_count
         },
         :play_count => {
           :this_month => current_count - thirty_days_ago_count
         }
      )
end
