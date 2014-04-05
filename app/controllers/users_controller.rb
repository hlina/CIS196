class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	#private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

	def index
		@users=User.all
	end
	
	def show
		@user = User.find(params[:id])
		@books = Book.where(user_id: @user.id)
		@quotes = Quote.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path(@user.id)
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def dash
		if user_signed_in?
			@user = current_user
			@followers = Follower.where(follower_id: current_user.id)
			@follower_id = []
			@followers.each do |follow|
				@follower_id.push(follow.followee_id)
			end
			@lent2 = Borrowed.all
			@lent_book = []
			@lent2.each do |lend|
				if !lend.book.nil?
				if lend.book.user_id == current_user.id
					@lent_book.push(lend.book)
				end
			end
			end
			@borrowed = Borrowed.where(user_id: current_user.id) 
			@books = Book.where(user_id: @follower_id).order(created_at: :desc).limit(5)
			@quotes = Quote.where(user_id: @follower_id).order(created_at: :desc).limit(5)

		else
			redirect_to users_path
		end
	end	
end
