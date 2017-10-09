# config valid only for Capistrano 3.1
# require 'capistrano/ext/multistage'
lock '3.9.1'

#set :stages, ["production"]
set :default_stage, "production"
set :ssh_options, {:forward_agent => true}

set :application, 'capistrano_example'
set :repo_url, 'git@github.com:yogesh-sinoriya/capistrano-practice.git'
set :user, "deploy"

set :linked_dirs, %w(my_shared_directory)

namespace :deploy do


    desc 'Print The Server Name'
    task :print_server_name do
      on roles(:app), in: :groups, limit:1 do
        execute "hostname"
      end
    end


    desc 'Start forever'
    task :start_forever do
      on roles(:app), in: :groups, limit:1 do
        execute "npm start"
      end
    end

    desc 'Restart forever'
    task :restart_forever do
      on roles(:app), in: :groups, limit:1 do
        execute "npm restart"
      end
    end
    desc 'Stop forever'
    task :stop_forever do
      on roles(:app), in: :groups, limit:1 do
        execute "npm stop"
      end
    end

end

after "deploy:updated", "deploy:print_server_name"
