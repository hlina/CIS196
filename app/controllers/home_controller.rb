class HomeController < ApplicationController
  def index
	@books = Book.limit(5)
  	@randomquote = Quote.order('RANDOM()').first.body
  end
 end
