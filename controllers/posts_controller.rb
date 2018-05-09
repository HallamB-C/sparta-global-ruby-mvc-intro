class PostsController < Sinatra::Base

  $posts = [
    {
      id: 0,
      title: "Posts 1",
      body: "This is the first post"
    },
    {
      id: 1,
      title: "Posts 2",
      body: "This is the second post"
    },
    {
      id: 3,
      title: "Posts 3",
      body: "This is the third post"
    }
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
    @title = "Blog posts"
    @posts = $posts
    erb :"posts/index"
  end
  #new
  get "/new" do
    "SHOW: This is the new form"
  end
  #create
  put "/:id" do
    "This will be the post method"
  end
  #edit
  put "/edit" do
    "This will update #{id}"
  end
  #show
  get "/:id" do
    @id = params[:id].to_i
    @title = $posts[@id][:title]
    @header = $posts[@id][:title]
    @body = $posts[@id][:body]
    erb :"posts/show"
  end



end
