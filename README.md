Soundcloud Play Counter
=========

# What is it

We want to get data about how many plays our podcasts are getting over time on Soundcloud. Unfortunately, the Soundcloud API only lets us get all time total plays for our tracks.

This simple Ruby application is meant to go out every 6 hours, get the total play count for all tracks from a user's Soundcloud account, and store it in a database. It also exposes an API to show total all-time plays over time, and plays in the last 30 days.

# Dependencies

See the `Gemfile`. At a basic level, it uses Sinatra to serve API requests, and the Whenever gem to run a regular rake task harvesting data from the Soundcloud API, and ActiveRecord/sqlite3 to store data.

# How to install it

You'll need Ruby, Bundler and some kind of Ruby environment manager (i.e. RVM) to run this app. You'll also need sqlite3.

Once you have those things, clone the repo down and run setup commands in your shell of choice:

```
$ git clone https://github.com/davidrleonard/soundcloud-play-counter.git && cd soundcloud-play-counter
$ bundle install # install all dependencies
```

At this point, you'll need to fill in secrets.yml (instructions coming soon) with you Soundcloud API authentication details. Then, you can move on with the installation commands:

```
$ bundle exec rake db:migrate # setup your database
$ bundle exec rake one_time_seed:seed_2015_plays # seed a past play count (see Rakefile for details)
$ bundle exec rake plays:get_plays # make your first API call to get some new play data from Soundcloud
$ bundle exec app.rb
```

Your application should now be running. [Check it out](http://localhost:4567/api/1/plays.json).

# Scheduling regular Soundcloud API calls

You'll need to regularly go out and get data from the Soundcloud API and put it into your local database to provide you with the data to do analytics over time. To accomplish this, we use the Whenever gem. A pre-set schedule has been specified in `config/schedule.rb` that runs the Rake task `plays:get_plays` every 6 hours.

To create a cron job to run that task, run the following:

```
$ bundle exec whenever # will show you what crontab whenever will write
$ bundle exec whenever -w # will write the crontab and start it
```

If you want to stop the crontab after it has been started, clear it:

```
$ bundle exec whenever -c # clears the crontab
```

# License

The MIT License (MIT)

Copyright (c) 2016 David Leonard

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
