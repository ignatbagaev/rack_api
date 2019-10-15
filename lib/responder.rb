class Responder
  class << self
    def respond(status, body)
      body = body.to_json
      response = Rack::Response.new
      response.status = status
      response.write(body)
      response['Content-Length'] = body.length.to_s
      response['Content-Type'] = 'application/json'
      response.finish
    end
  end
end
