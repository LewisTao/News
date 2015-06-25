class UserService
  class << self
    def find_author(params)
      author = Author.find_by(id: params)
    end

    def create_author(params)
        author = Author.new(params)
        if author.save
          return author
        else
          return author.errors
        end
    end
  end
end
