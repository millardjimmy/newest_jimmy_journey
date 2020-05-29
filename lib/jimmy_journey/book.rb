require 'rubygems'
require 'httparty'

class Books
    attr_accessor :books

    def book_list
        document =Httparty.get('https://the-one-api.herokuapp.com/v1/movie')
        @books = document.collect {|i| i["name"]}
    end

end