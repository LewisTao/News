class Api::V1::AuthorsController < ApplicationController
	
	# Show action
	def show
		author = Author.find(params[:id])
		render json: author
	end

	# Index action
	def index
		authors = Author.all
		render json: authors
	end

	# Create action
	def create
		author = Author.new(author_params)
		if author.save
			render json: author, status: 201
		else
			render json: { errors: author.errors }, status: 422
		end
	end

	# Update action
	def update
		author = Author.find(params[:id])
		if author.update(author_params)
			render json: author, status: 200
		else
			render json: { errors: author.errors }, status: 422
		end
	end

	# Destroy author
	def destroy
		author = Author.find(params[:id])
		author.destroy
		head 204
	end

	private
		def author_params
			params.require(:author).permit(:name, :email)
		end
end
