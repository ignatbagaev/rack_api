require './lib/router'
require './lib/dispatcher'

app = proc do |env|
  request = Rack::Request.new(env)
  route_info = Router.route_info(request)
  request.params.merge!(route_info[:params]) if route_info[:params]&.any?
  Dispatcher.serve(route_info[:controller], route_info[:action], request)
end

run app
