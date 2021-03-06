# -*- coding: utf-8 -*-

require 'uri'
require 'net/http'

Termtter::Client.register_hook(
  :name => :wassr_post,
  :points => [:modify_arg_for_update],
  :exec_proc => lambda {|cmd, arg|
    begin
      Net::HTTP.version_1_2
      req = Net::HTTP::Post.new("/statuses/update.json?")
      req.basic_auth config.plugins.wassr_post.username, config.plugins.wassr_post.password
      Net::HTTP.start('api.wassr.jp', 80) do |http|
        res = http.request(req, "status=#{URI.escape(arg.strip)}&source=Termtter")
      end
    rescue
      puts "RuntimeError: #{$!}"
    end
    return arg
  }
)
