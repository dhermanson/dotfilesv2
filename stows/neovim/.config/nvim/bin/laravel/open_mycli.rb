require 'open3'

begin
  puts "Checking if dotenv installed..."
  gem "dotenv"
rescue LoadError
  puts "Not installed. Installing..."
  system "gem install dotenv"
  Gem.clear_paths
end

puts "dotenv installed."

puts "Checking if mycli installed..."
unless Open3.popen3('brew ls --versions mycli') { |ls_stdin, ls_stdout, ls_stderr, ls_wait_thr| ls_wait_thr.value.success? }
  puts "Installing mycli..."
  Open3.popen3('brew install mycli') do |install_stdin, install_stdout, install_stderr, install_wait_thr|
    unless install_wait_thr.value.success?
      while line = install_stderr.gets
        puts line
      end
    end
  end
end

puts "mycli installed"

#require 'dotenv'

#Dotenv.load '.env'

#host = ENV['DB_HOST']
#port = ENV['DB_PORT']
#db = ENV['DB_DATABASE']
#user = ENV['DB_USERNAME']
#pass = ENV['DB_PASSWORD']

#system "mycli -h #{host} -P #{port} -D #{db} -u #{user} -p #{pass}"
