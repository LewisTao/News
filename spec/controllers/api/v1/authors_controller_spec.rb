require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :controller do
	# Show action
	describe 'GET #show' do
		before(:each) do
			@author = FactoryGirl.create :author
			get :show, id: @author.id
		end

		it 'returns the information about the author on a hash' do
			author_response = JSON.parse(response.body, symbolize_names: true)
			expect(author_response[:email]).to eql @author.email
		end
	end

	# Create action
	describe 'POST #create' do
		before(:each) do
			@author_attributes = FactoryGirl.attributes_for :author
			post :create, author: @author_attributes
		end

		# Successfully create new author
		context 'successfully create new author' do
			it 'returns author information just create' do
				author_response = JSON.parse(response.body, symbolize_names: true)
				expect(author_response[:email]).to eql @author_attributes[:email]
			end
		end

		# Un-success create new author
		context 'un-success create new author' do
			before(:each) do
				@invalid_author_attributes = { name: 'demo', email: 'abc' }
				post :create, author: @invalid_author_attributes
			end

			it 'returns full erros messages' do
				author_response = JSON.parse(response.body, symbolize_names: true)
				expect(author_response[:email]).to include 'wrong email address'
			end
		end
	end

	# Update action
	describe 'PUT #update' do
		# Success update new author
		context 'success update author' do
			before(:each) do
				@author = FactoryGirl.create :author
				put :update, { id: @author.id, author: { name: 'New author name' }}
			end

			it 'returns new author information' do
				author_response = JSON.parse(response.body, symbolize_names: true)
				expect(author_response[:name]).to eql 'New author name'
			end
		end

		# un-success update author
		context 'un-success update author' do
			before(:each) do
				@author = FactoryGirl.create :author
				put :update, { id: @author.id, author: { email: 'invalid email' } }

			end

			it ' returns full errors messages' do
				@author_response = JSON.parse(response.body, symbolize_names: true)
				expect(@author_response[:errors][:email]).to include 'wrong email address'
			end
		end
	end

	# Destroy action
	describe 'delete #destroy' do
		before(:each) do
			@author = FactoryGirl.create :author
			delete :destroy, id: @author.id
		end
	end
end
