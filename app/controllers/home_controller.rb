class HomeController < ApplicationController
  def index
	@books = Book.order(created_at: :desc)
	if !Quote.order('RANDOM()').first.nil?
  		@randomquote = Quote.order('RANDOM()').first.body
  	end
  end
 end
