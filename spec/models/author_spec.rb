require 'rails_helper'

RSpec.describe Author, type: :model do
	before { @author = FactoryGirl.build(:author) }
	subject { @author }

	# Attributes respond
	it { should respond_to(:email) }
	it { should respond_to(:name) }

	it { should be_valid }

	# Attributes Validate
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:email) }
	it { should allow_value('example@domain.com').for(:email) }
end
