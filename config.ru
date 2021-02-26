require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require_relative "controllers/leader_controller.rb"
require_relative "models/leader.rb"
# require_relative "controllers/users_controller.rb"
use Rack::MethodOverride

run LeadersController
# run UsersController
