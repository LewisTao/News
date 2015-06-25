class Author < ActiveRecord::Base
  # Before filter
  before_validation :downcase_email

  # Attributes Validate
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => 'wrong email address'


  private

  def downcase_email
    email.downcase! if email.present?
  end
end
