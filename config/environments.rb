require 'yaml'

configure :production, :development do
  # Setup the secrets we'll need to call Souncloud API
  if File.exists? (File.expand_path("../secrets.yml", __FILE__))
    SC_CONFIG = YAML.load_file(File.expand_path("../secrets.yml", __FILE__))
  else
    SC_CONFIG = {}
    SC_CONFIG['client_id'] = ENV['SC_CLIENT_ID']
    SC_CONFIG['client_secret'] = ENV['SC_CLIENT_SECRET']
    SC_CONFIG['username'] = ENV['SC_USERNAME']
    SC_CONFIG['password'] = ENV['SC_PASSWORD']
  end
end

configure :production do
  set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}
end

configure :development do
  set :database, {adapter: "sqlite3", database: "db/debug.sqlite3"}
end
