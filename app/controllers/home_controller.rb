class HomeController < ApplicationController
  def index
	@books = Book.order(created_at: :desc)
  	@randomquote = Quote.order('RANDOM()').first.body
  end
 end
