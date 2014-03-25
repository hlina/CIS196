class QuotesController < ApplicationController
	def new
		if user_signed_in?
		@quote = Quote.new
		else 
			redirect_to new_user_session_path
		end
	end

	def create
		@quote = Quote.new(quote_params)
		if @quote.user_id != current_user.id
			render 'new'
		else
			if @quote.save 
				redirect_to quotes_path
			else
				render 'new'
			end
		end
	end


	def index
		@quotes = Quote.all
	end

	def show
		@quote = Quote.find(params[:id])
	end


	def edit
		@quote = Quote.find(params[:id])
	end

	def update
		@quote = Quote.find(params[:id])
		if @quote.user_id != current_user.id
			render 'edit'
		else
			if @quote.update(quote_params)
				redirect_to @quote
			else
				render 'edit'
			end
		end
	end

	def destroy
		@quote = Quote.find(params[:id])
		@quote.destroy
		redirect_to quotes_path
	end
	
 	private

	def quote_params
		params.require(:quote).permit(:body, :category, :user_id)
	end

end
