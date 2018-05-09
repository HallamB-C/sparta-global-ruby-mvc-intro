class UsersController < Sinatra::Base

  $users = [
    {
      id: 0,
      email: "joe@spartaglobal.com",
      first_name: "Joe",
      last_name: "Childs"
    },
    {
      id: 1,
      email: "markson@spartaglobal.com",
      first_name: "Markson",
      last_name: "Aigbodi"
    },
    {
      id: 2,
      email: "lexie@spartaglobal.com",
      first_name: "Lexie",
      last_name: "Papaspyrou"
    },
  ]

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }


  configure :development do
    register Sinatra::Reloader
  end

  #index
  get "/" do
    @title = "Users"
    @users = $users
    erb :"users/index"
  end
  #new
  get "/new" do
    "SHOW: This is the new user page"
  end
  #create
  put "/:id" do
    "This will be the create user method"
  end
  #edit
  put "/edit" do
    "This will update user #{id}"
  end
  #show
  get "/user/:id" do
    @id = params[:id].to_i
    @email = $users[@id][:email]
    @first_name = $users[@id][:first_name]
    @last_name = $users[@id][:last_name]
    erb :"users/show"
  end



end
