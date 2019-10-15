require 'logger'

DB_CONNECTION = Sequel.connect('sqlite://db/rack_api.db', logger: Logger.new(STDOUT))
