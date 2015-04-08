class BooksController < ApplicationController
before_action :authenticate_user!, :except => 'index'
	
	# Get all books 
	def index
		@books = Book.all.where("title LIKE ?" , "%#{params[:search]}%")
		# Filter by category if need
		@books = Book.all.where("title LIKE ?" , "%#{params[:search]}%").where(:category => params[:category_filter]) if params[:category_filter].present?
	end

	# Get all user list
 	def user_index
 		@users = User.all
 	end

 	# Get new object of book
	def new
		@book = Book.new
	end

	# Save book in database
	def create
		@book = Book.new(book_params)
		@book.save
		redirect_to books_path
	end

	# Get book object by id
	def edit
		@book = Book.find(params[:id])
	end

	# Show a book 
	def show_book
		@book = Book.find(params[:id])
	end

	# Update book database
	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to books_path
	end

	# Delete book 
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	# Delete user
	def destroy_user
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :back
	end

	private
    # Never trust parameters from the scary internet, only allow the white list through.
	def book_params
		params.require(:book).permit(:book_image, :title, :description, :category, :author)
	end
end
