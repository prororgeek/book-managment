class BooksController < ApplicationController
before_action :authenticate_user!, :except => 'index'
	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.save
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
	end

	def show_book
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to books_path
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:book_image, :title, :description, :category)
	end
end
