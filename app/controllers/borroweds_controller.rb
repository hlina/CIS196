class BorrowedsController < ApplicationController

def create 
	@borrowed = Borrowed.new(borrowed_params)
	if @borrowed.save
		Notifications.borrow(@borrowed).deliver
		redirect_to books_path
	end
end

def borrowed_params
	params.require(:borrowed).permit(:user_id, :book_id)
end
end
