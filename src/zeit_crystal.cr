require "./zeit_crystal/*"
require "http/server"

# TODO: Write documentation for `ZeitCrystal`
module ZeitCrystal
  def start
    port = (ENV["PORT"]? || "3000").to_i
    server = HTTP::Server.new("0.0.0.0", port) do |context|
      context.response.content_type = "text/plain"
      context.response.print "Hello world from Crystal Lang!"
    end
    puts "Starting server on port #{port}"
    server.listen
  end
end

Signal::INT.trap { puts "Caught Ctrl+C..."; exit }
Signal::TERM.trap { puts "Caught kill..."; exit }

include ZeitCrystal
start
