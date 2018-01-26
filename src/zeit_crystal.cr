require "./zeit_crystal/*"
require "http/server"

# TODO: Write documentation for `ZeitCrystal`
module ZeitCrystal
  def start
    port = 3000
    server = HTTP::Server.new(port) do |context|
      context.response.content_type = "text/plain"
      context.response.print "Hello world from Crystal Lang!"
    end
    puts "Starting server on port #{port}"
    server.listen
  end
end

include ZeitCrystal
start
