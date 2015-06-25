require 'rails_helper'

describe AuthorDecorator do
  before(:each) do
    @author = FactoryGirl.create :author
  end
  describe 'author info' do
    it 'should return correct author attributes' do
      expect_hash_eq(@author.decorate.author_info, {name: @author.name, email: @author.email})
    end
  end
end
