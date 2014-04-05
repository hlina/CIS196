class HomeController < ApplicationController
  def index
	@book = Book.limit(5)
  	@randomquote = Quote.order('RANDOM()').first.body
  end
end
