class LeadersController < Sinatra::Base

  # $leaders = [
  #   {
  #     id: 0,
  #     name: "Ubol Grol",
  #     global_bonus: "When Ubol loses a unit roll a die. On a roll of 1 or 3 the unit is added to Ubol's crypt."
  #     active_bonus: "Ubol may hit 2 non-cannon units on a roll of 6"
  #   },
  # ]

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }


  configure :development do
    register Sinatra::Reloader
  end

  #index
  get "/" do
    @title = "Leaders of Albion"
    @leaders = Leader.all
    erb :"posts/index"
  end

  #new
  get "/new" do
      @leader = Leader.new
    erb :"posts/new"
  end

  #create
  post "/" do
    leader = Leader.new

    leader.name = params[:name]
    leader.global_bonus = params[:global_bonus]
    leader.active_bonus = params[:active_bonus]

    leader.save

    redirect "/"

  end

  #update
  put "/:id" do
    id = params[:id]

    leader = Leader.find(id)

    leader.name = params[:name]
    leader.global_bonus = params[:global_bonus]
    leader.active_bonus = params[:active_bonus]

    leader.save

    redirect "/"
  end

  #destroy
  delete "/:id" do
    id = params[:id]


    Leader.destroy id

    redirect "/"
  end

  #edit
  get "/:id/edit" do
    id = params[:id]
      @leader = Leader.find id
    erb :"posts/edit"
  end

  #show
  get "/:id" do
    id = params[:id]
  @leader = Leader.find id
  erb :"posts/show"

  end



end
