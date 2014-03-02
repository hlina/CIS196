class BooksController < ApplicationController
	def new
		if user_signed_in?
			@book = Book.new
		else 
			redirect_to new_user_session_path
		end
	end

	def create
		@book = Book.new(book_params)
		if @book.user_id != current_user.id
			render 'new'
		else
			if @book.save
				redirect_to books_path
			else
				render 'new'
			end
		end
	end

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			render 'edit'
		else

			if @book.update(book_params)
				redirect_to @book
			else
				render 'edit'
			end
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body, :category, :date, :rating, :user_id)
	end

end
