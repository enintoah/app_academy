# require_relative "piece"
require "Singleton"

class NullPiece 
    

    include Singleton
   
    # def initialize
    # end

    def empty?
        return true
    end

    def to_s
        " "
    end

end