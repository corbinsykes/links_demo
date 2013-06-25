require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

# get '/manual_links' do
#   @links = ['http://funnyjunk.com',
#             'http://gizmodo.com',
#             'http://reddit.com',
#             'http://grantland.com',
#             'http://avclub.com']
#   erb :links
# end
get '/about' do
  "I'm me"
end


get '/links' do
  link_file = File.new('links.csv', 'r')
  @links = []
  link_file.each do |line|
    @links << line.split(',')
  end
  link_file.close
  erb :links
end

post '/navigate' do
  case params[:destination].downcase
    when "links" then redirect to ("/links")
    when "about" then redirect to ("/about")
  end
end