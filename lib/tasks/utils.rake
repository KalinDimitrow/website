require 'shell_command'

namespace :utils do
  desc "Start pod with postgres"
  task :start_postgres do
    stop_all_containers = 'a=$(podman ps -a -q); pd stop ${a}; pd rm ${a}'
    ShellCommand.new(stop_all_containers, chdir: __dir__).run
    start_postgres = 'podman run --name base -d -e POSTGRES_USER=base -e POSTGRES_PASSWORD=base -e POSTGRES_HOST_AUTH_METHOD=trust -p 5432:5432 4d8f13d97fae'
    ShellCommand.new(start_postgres, chdir: __dir__).run
  end
end
