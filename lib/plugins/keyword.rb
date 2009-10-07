# -*- coding: utf-8 -*-
config.plugins.keyword.set_default(:keywords, [])
config.plugins.keyword.set_default(:ignores, [])
module Termtter::Client
  register_hook(
    :name => :highlight_keywords,
    :point => :pre_coloring) do |text, event|
    query = config.plugins.keyword.keywords.map {|q|Regexp.quote(q)}.join("|")
    text.gsub(/(#{query})/i, '<on_green><white>\1</white></on_green>')
  end

  register_hook(
    :name => :ignore,
    :point => :filter_for_output,
    :exec => lambda { |statuses, event|
      ignore_words = config.plugins.keyword.ignores
      statuses.delete_if do |s|
        ignore_words.any? do |word|
          word = /#{Regexp.quote(word)}/ if word.kind_of? String
          word =~ s.text
        end
      end
    }
  )
end

# keyword.rb
#   provides a keyword watching method and ignore methods
# setting
#   config.plugins.keyword.keywords = [ 'key', 'words' ]
#   config.plugins.keyword.ignores  = [ 'key', 'words' ]
