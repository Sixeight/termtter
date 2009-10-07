# -*- coding: utf-8 -*-

module Termtter::Client
  register_command(
    :name => :exec,
    :alias => :'!',
    :exec_proc => lambda{|arg|
      system *arg.split(/\s+/) if arg
    },
    :help => ['exec SHELL_COMMAND', 'execute a shell command']
  )

  register_command(
    :name => :exec_and_update,
    :exec_proc => lambda{|arg|
      return unless arg
      `#{arg}`.each_line do |line|
        next if line =~ /^\s*$/
        Termtter::API.twitter.update(line)
        puts "=> #{line}"
      end
    },
    :help => ['exec_and_update COMMAND', 'execute and update the command']
  )

end

