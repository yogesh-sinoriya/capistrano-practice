
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'develop'
set :deploy_to, "/usr/share/nginx/www-data/"

server '172.17.0.3', user: 'deploy', roles: %w{web app db}

set :keep_releases, 2

after 'deploy:publishing', 'deploy:restart'