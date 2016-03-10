require 'pry'
require "sinatra/base"
require "etsy"
require "etsiest2/version"

#according to instructions, it is outside the module
Etsy.api_key = ENV["ETSY_KEY"]
# run this in the shell "ETSY_KEY=foobarbaz bundle exec ruby lib/etsiest.rb"

module Etsiest2
  # Your API call goes here...It reaches for the data from etsy.
  	class App < Sinatra::Base

 		get "/" do
      		results = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'death')
		  	erb :index, locals: { results: results }
      	end
      	run! if app_file == $0
end	end	#the above line is magic
