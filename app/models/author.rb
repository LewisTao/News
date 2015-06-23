class Author < ActiveRecord::Base
	# Attributes Validate
	validates_presence_of :email, :name
	validates_uniqueness_of :email
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
