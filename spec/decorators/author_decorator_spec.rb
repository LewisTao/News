require 'rails_helper'

describe AuthorDecorator do
  before(:each) do
    @author = FactoryGirl.create :author
  end
  describe 'author info' do
    it 'should return correct author attributes' do
      expect(@author.decorate.author_info.symbolize_keys).to eql(name: @author.name, email: @author.email)
    end
  end

end
