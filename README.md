#Sinatra Extension: redirect with flash

Shortly: sinatra-redirect-with-flash provides `redirect` helper that can set proper flash (rack-flash) before the
  redirection

In fact, every time you set a flash parameter the very next step is often to perform your redirect:

    post '/posts/?' do
      @post = Post.new(params)
      flash[:notice] = 'The post was successfully created'
      redirect "/posts/#{@post.id}"
    end

With sinatra-redirect-with-flash you can do one-line redirects. For instance, to rewrite the above example:

    post '/posts/?' do
      @post = Post.new(params)
      redirect "/posts/#{@post.id}", :notice => 'The post was successfully created'
    end

##Example
    require 'rubygems'
    require 'sinatra'
    require 'rack-flash'
    require 'sinatra/redirect_with_flash'

    use Rack::Flash
    enable :sessions

    post '/sessions/new' do
      redirect '/secret', :notice => 'Logged in' #predefined keys are: :notice, :error, :warning, :alert, :info      
    end

    get '/foo' do
      redirect '/bar', 301, :notice => 'redirect with 301 code'
    end

    get '/archive' do
      redirect '/posts/', :flash => {:my_msg => 'Moving on!'}      
    end

##Requirements
  * [rack-flash](http://nakajima.github.com/rack-flash/)