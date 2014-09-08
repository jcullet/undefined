require "vertx"
include Vertx

server = Vertx::HttpServer.new

server.request_handler do |request|
  puts "An HTTP request has been received"
  request.response.end("Here is an HTTP response!")
end

server.listen(8080, 'localhost')
