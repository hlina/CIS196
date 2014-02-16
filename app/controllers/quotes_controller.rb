class QuotesController < ApplicationController
	def new
		@quote = Quote.new
	end

	def create
		@quote = Quote.new(quote_params)
		if @quote.save #What is this?
			redirect_to quotes_path #What is this?
		else
			render 'new'
		end
	end

	#private

	def quote_params
		params.require(:quote).permit(:body, :category, :user_id)
	end

	def index
		@quotes = Quote.all
	end

	def show
		@quote = Quote.find(params[:id])
	end

	def update
		@quote = Quote.find(params[:id])

		if @quote.update(params[:quote].permit(:title, :body))
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		@quote = Quote.find(params[:id])
		@quote.destroy
		redirect_to quotes_path
	end

end





