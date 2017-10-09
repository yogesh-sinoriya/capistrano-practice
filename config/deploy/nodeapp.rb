
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'node-app'
set :deploy_to, "/home/deploy/dev/nodeapp"

server '172.17.0.5', user: 'deploy', roles: %w{web app db}

set :keep_releases, 2

after 'deploy:publishing', 'npm:restart'