require "sinatra"
require "sinatra/reloader" if development?
require_relative "controllers/posts_controller.rb"
require_relative "controllers/users_controller.rb"

run PostsController
run UsersController
