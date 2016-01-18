require 'sinatra'
require 'sinatra/activerecord'
require "sinatra/json"
require './config/environments' # database configuration
require './models/plays'

get '/' do
  # @last_play = Play.last(1)
  # "Current play count: #{@last_play[0].play_count}"

  # Shhhh. Just say hi.
  'Hi.'
end

get '/api/1/plays.json' do
  # Get all of our plays
  plays = Play.all

  # Get play count for right now
  current_plays = plays.order(:created_at).last(1)
  current_count = current_plays[0].play_count

  # Get play count for 30 days ago
  thirty_days_ago_plays = plays.where(['created_at < ?',30.days.ago]).order(:created_at).last(1)
  thirty_days_ago_count = thirty_days_ago_plays[0].play_count

  # Get play count for 60 days ago
  sixty_days_ago_plays = plays.where(['created_at < ?',60.days.ago]).order(:created_at).last(1)
  sixty_days_ago_count = sixty_days_ago_plays[0].play_count

  json(
        :all_time_plays => {
           :today => current_count,
           :thirty_days_ago => thirty_days_ago_count,
           :sixty_days_ago => sixty_days_ago_count
         },
         :play_count => {
           :this_month => current_count - thirty_days_ago_count,
           :last_month => thirty_days_ago_count - sixty_days_ago_count
         }
      )
end
