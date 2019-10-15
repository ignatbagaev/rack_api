class Router
  class << self
    def routes
      @routes ||= {}
    end

    def route_info(request)
      found_route, path_params = find_route(request.request_method, request.path)
      return unless found_route

      controller, action = found_route[:to].split('#')
      { controller: controller, action: action, params: path_params }
    end

    private

    def find_route(verb, path)
      verb = verb.to_s.upcase
      path.gsub!(/\/+/, '/').gsub!(/(\/+|\..+)\z/, '')
      path_params = nil
      found_route = routes[verb].detect do |verb_route|
        path_params = path.match(verb_route[:regexp])&.named_captures
      end
      [found_route, path_params]
    end

    def pattern_to_regexp(pattern)
      regexp_string = '^' + pattern.gsub(/:([a-z_]+)/, '(?<\\1>([0-9]+))') + '$'
      Regexp.new regexp_string
    end

    def route(verb, options)
      verb = verb.to_s.upcase
      routes[verb] ||= []
      options[:regexp] = pattern_to_regexp(options[:pattern])
      routes[verb] << options
    end
  end

  route :post, pattern: '/users',     to: 'users#create'
  route :get,  pattern: '/users',     to: 'users#index'
  route :get,  pattern: '/users/:id', to: 'users#show'
end
