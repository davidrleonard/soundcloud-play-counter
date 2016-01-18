require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require './app'
  end
end

namespace :plays do
  task :get_plays do
    require './app'
    require './jobs/get_plays'
    getter = PlaysGetter.new
    play = Play.create(play_count: getter.current_play_count.to_i)
    puts "Done! I counted an all time total of #{getter.current_play_count} plays."
  end
end

namespace :one_time_seed do
  task :seed_2015_plays do
    # This is meant to be used once to seed the database. It puts the play
    # count for Dec. 15 2015 and Nov. 18, 2015 into the database so we can
    # run the right operations starting from day 1.
    require './app'
    first_play = Play.create( play_count: 1684397,
                              created_at: 31.days.ago,
                              updated_at: 31.days.ago )
    second_play = Play.create( play_count: 1584497,
                               created_at: 61.days.ago,
                               updated_at: 61.days.ago )
    puts 'Seeded play count!'
  end
end
