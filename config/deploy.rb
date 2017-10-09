# config valid only for Capistrano 3.1
# require 'capistrano/ext/multistage'
lock '3.9.1'

#set :stages, ["production"]
set :default_stage, "production"
set :ssh_options, {:forward_agent => true}

set :application, 'capistrano_example'
set :repo_url, 'git@github.com:yogesh-sinoriya/capistrano-practice.git'
set :user, "deploy"

set :linked_dirs, %w(node_modules)

set :npm_target_path, '/home/deploy/dev/nodeapp/current/' #-> { release_path.join('/home/deploy/dev/nodeapp') } # default not set
# set :npm_flags, '--production --silent --no-progress'    # default
# set :npm_roles, :all                                     # default
# set :npm_env_variables, {}                               # default

namespace :deploy do


    desc 'Print The Server Name'
    task :print_server_name do
      on roles(:app), in: :groups, limit:1 do
        execute "hostname"
      end
    end
end

namespace :npm do

	desc 'Start'
    task :start do
      on roles(:app), in: :groups, limit:1 do
        execute :npm, :start, fetch(:app_command)
      end
    end

    desc 'Restart'
    task :restart do
      on roles(:app), in: :groups, limit:1 do
        execute "cd #{npm_target_path} && ./node_modules/.bin/forever start app.js"
        #execute :npm,:restart, fetch(:app_command)
      end
    end
    desc 'Stop'
    task :stop do
      on roles(:app), in: :groups, limit:1 do
        execute :npm, :stop, fetch(:app_command)
      end
    end
end

after "deploy:updated", "deploy:print_server_name"
