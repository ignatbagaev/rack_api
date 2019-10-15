app_files = File.expand_path('./controllers/*.rb', __dir__)
Dir.glob(app_files).each { |file| require(file) }

require './lib/responder'

class Dispatcher
  class << self
    def serve(controller_name, action, request)
      return not_found unless controller_name && action

      controller = Object.const_get("#{controller_name.capitalize}Controller")
      puts "Processing by #{controller}##{action}"
      puts "Parameters: #{request.params.inspect}"
      response_params = controller.new(request).send(action)
      Responder.respond(response_params[:status], response_params[:body])
    end

    private

    def not_found
      Responder.respond(404, 'Not Found')
    end
  end
end
