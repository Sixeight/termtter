def fib(n)i=0;j=1;n.times{j=i+i=j};i end

module Termtter::Client
  register_command(:fib) do |arg|
    n = arg.to_i
    text = "fib(#{n}) = #{fib n}"
    Termtter::API.twitter.update(text)
    puts "=> " << text
  end

  register_command(:fibyou) do |arg|
    /(\w+)\s(\d+)/ =~ arg
    name = normalize_as_user_name($1)
    n = $2.to_i
    text = "@#{name} fib(#{n}) = #{fib n}"
    Termtter::API.twitter.update(text)
    puts "=> " << text
  end
end
