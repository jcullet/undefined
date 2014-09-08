require "vertx"
include Vertx

logger = Vertx.logger

@server = NetServer.new.connect_handler { |socket|
  logger.info "Echoing data back to sender"
  Pump.new(socket, socket).start
}.listen(1234, 'localhost')

def vertx_stop
  @server.close
end
