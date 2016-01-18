# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/sc.radioambulante.org"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/sc.radioambulante.org/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/logs/unicorn.log"
# stdout_path "/path/to/logs/unicorn.log"
stderr_path "/var/www/sc.radioambulante.org/logs/unicorn.log"
stdout_path "/var/www/sc.radioambulante.org/logs/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.sc.radioambulante.org.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
