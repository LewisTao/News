require 'rails_helper'

describe UserService do
  describe 'find_author' do
    before(:each) do
      @author = FactoryGirl.create :author
    end
    it 'should returns author' do
      author = Author.find_by(id: @author.id)
      expect(author).to be_valid
    end
  end

  describe 'create_author' do
    before(:each) do
      @author_attributes = FactoryGirl.attributes_for :author
    end

    context 'success create author' do
      it 'returns author information after create' do
        @author = Author.create(@author_attributes)
        expect(@author.email).to eql @author_attributes[:email]
      end
    end
  end
end
