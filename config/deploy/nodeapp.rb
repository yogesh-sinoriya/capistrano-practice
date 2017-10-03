
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'node-app'
set :deploy_to, "/usr/share/nginx/www-data/"

server '172.17.0.2', user: 'deploy', roles: %w{web app db}

set :keep_releases, 2