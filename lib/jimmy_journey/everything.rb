class Everything
    attr_accessor :id, :name, :author, :title, :description, :content, :url
    attr_accessor :name
    attr_accessor :author
    attr_accessor :title
    attr_accessor :description
    attr_accessor :content
    attr_accessor :url

    def initialize(source, author, title, description, content, url, urlToImage, publishedAt)
        @id = source["id"]
        @name = source["name"]
        @author = author
        @title = title
        @description = description
        @content = content
        @url = url
    end
end