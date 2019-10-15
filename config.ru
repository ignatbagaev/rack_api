app = proc { |_env| [200, { 'Content-Type' => 'text/html' }, ['Hello there!']] }

run app
