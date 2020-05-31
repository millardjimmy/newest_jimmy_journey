class Jimmyjourney::Movie
    attr_accessor :name, :year, :director, :actors

    @@all = []

    def initialize(name, year)
        @name = name
        @year = year
        
        @@all << self
    end

    def self.all
        @@all
    end

    def save
        @@all << self
        self
    end


end