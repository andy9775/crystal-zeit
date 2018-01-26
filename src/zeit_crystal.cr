require "./zeit_crystal/*"
require "http/server"

# TODO: Write documentation for `ZeitCrystal`
module ZeitCrystal
  def start
    port = (ENV["PORT"]? || "3000").to_i
    server = HTTP::Server.new("0.0.0.0", port) do |context|
      context.response.content_type = "text/html"
      context.response.print "
        <!DOCTYPE html>
          <html>
          <head>
            <meta charset=\"utf-8\">
            <meta name=\"viewport\" content=\"width=device-width\">
            <title>Crystal</title>
          </head>
          <body>
            <div>Hello world from crystal lang and zeit!
          </body>
          </html>
      "
    end
    puts "Starting server on port #{port}"
    server.listen
  end
end

Signal::INT.trap { puts "Caught Ctrl+C..."; exit }
Signal::TERM.trap { puts "Caught kill..."; exit }

include ZeitCrystal
start
