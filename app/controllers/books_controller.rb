class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to books_path
		else
			render 'new'
		end
	end

	def book_params
		params.require(:book).permit(:title, :body, :category, :date, :rating, :user_id)
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

		if @book.update(params[:book].permit(:title, :body, :category, :date, :rating, :user_id))
			redirect_to @book
		else
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
end
