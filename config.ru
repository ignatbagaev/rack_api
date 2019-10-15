require './lib/router'

app = proc do |env|
  request = Rack::Request.new(env)
  route_info = Router.route_info(request)
  status, body =
    if route_info
      [200, 'OK']
    else
      [404, 'Not Found']
    end
  [status, { 'Content-Type' => 'application/json' }, [body]]
end

run app
