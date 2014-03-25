class HomeController < ApplicationController
  def index
  	@books = Book.all
  	@randomquote = Quote.order('RANDOM()').first.body
  end
end
