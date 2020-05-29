require 'rubygems'
require 'httparty'

class Movies
    attr_accessor :Movies

    def character_list
        document =Httparty.get('https://the-one-api.herokuapp.com/v1/characters' headers:{"Authorization: Bearer A91KIWpP-ITtVQbE8q-9"})
        @movies = document.collect {|i| i["name"]}
    end

end

