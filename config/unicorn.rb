listen "/tmp/unicorn.sock"

worker_processes 2

pid "tmp/pids/unicorn.pid"

stderr_path "log/unicorn.stderr.log"
stdout_path "log/unicorn.stdout.log"
