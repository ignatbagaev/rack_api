require 'logger'

Sequel::Model.plugin :validation_helpers

DB_CONNECTION = Sequel.connect('sqlite://db/rack_api.db', logger: Logger.new(STDOUT))

DB_CONNECTION.create_table? :users do
  primary_key :id
  String :email, unique: true, null: false
end
