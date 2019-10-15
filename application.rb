require 'sequel'
require './db/setup'
require './lib/router'
require './lib/dispatcher'

models_files = File.expand_path('./lib/models/*.rb', __dir__)
Dir.glob(models_files).each { |file| require(file) }

class Application
  def call(env)
    request = Rack::Request.new(env)
    route_info = Router.route_info(request)
    request.params.merge!(route_info[:params]) if route_info[:params]&.any?
    Dispatcher.serve(route_info[:controller], route_info[:action], request)
  end
end
