require 'rubygems'
require 'sinatra'
require 'sinatra/flash'
require './lib/sinatra/redirect_with_flash'

enable :sessions

get '/' do
  redirect '/fff', :flash => {:info => 'sample info'}
end

Sinatra::RedirectWithFlash::COMMON_FLASH_NAMES.each do |k|
  get "/#{k.to_s}" do
    redirect '/fff', k => "sample #{k.to_s}"
  end
end

get '/notice-with-code' do
  redirect '/fff', 301, :notice => '301 and notice'
end

get '/old-school-redirect' do
  redirect '/aaa'
end

get '/old-school-redirect-with-code' do
  redirect '/aaa', 301
end
