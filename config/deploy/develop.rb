
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'develop'
set :deploy_to, "/usr/share/nginx/node/"

server '172.17.0.3', user: 'deploy', roles: %w{web app db}

after 'deploy:publishing', 'deploy:restart'