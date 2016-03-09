require 'pry'
require "sinatra/base"
require "etsy"
require "etsiest2/version"

#according to instructions, it is outside the module
Etsy.api_key = ENV["ETSY_KEY"]
# run this in the shell "ETSY_KEY=foobarbaz bundle exec ruby lib/etsiest.rb"

module Etsiest2
  # Your API call goes here...
  	class App < Sinatra::Base

 		get "/" do
      		response=Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'death')
		  	erb :index, locals: { results: response.result }
      	end

end
