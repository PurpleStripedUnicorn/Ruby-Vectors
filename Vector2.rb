class Vector2

    # make x and y components publicly accessable
    attr_accessor :x, :y
    # set counter of amount of 'Vector2' objects to zero
    @@count = 0

    def initialize (x, y)
        # define x and y components to vector
        @x = x
        @y = y
        # add 1 to the counter of initiated 'Vector2' ojects
        @@count += 1
    end

    # count the amount of 'Vector2' objects initiated
    def self.count
        @@count
    end

    # add something to a vector
    def + (other)
        # add 2 vectors together
        if other.instance_of?(Vector2)
            Vector2.new(@x + other.x, @y + other.y)
        # add a number to a vector
        else
            Vector2.new(@x + other, @y + other)
        end
    end

    # subtract
    def - (other)
        # subtract 2 vectors
        if other.instance_of?(Vector2)
            Vector2.new(@x - other.x, @y - other.y)
        # subtract a number from a vector
        else
            Vector2.new(@x - other, @y - other)
        end
    end

    # multiply two vectors, getting a number out of it
    # OR multiply a vector with a fixed number, getting a vector
    def * (other)
        # multiply 2 vectors
        if other.instance_of?(Vector2)
            @x * other.x + @y * other.y
        else
            # multiply a number with a vector
            Vector2.new(@x * other, @y * other)
        end
    end

    # devide a vector with a number
    def / (other)
        Vector2.new(@x / other, @y / other)
    end

    # checks if two vectors are exactly the same by comparing both 'x' and 'y'
    #   components of the vectors
    def == (other)
        @x == other.x && @y = other.y
    end

    # 'less than' operator compares two lengths of vectors
    def < (other)
        (@x**2 + @y**2) ** 0.5 < (other.x**2 + other.y**2)
    end

    # 'more than' operator compares two lengths of vectors
    def > (other)
        (@x**2 + @y**2) ** 0.5 > (other.x**2 + other.y**2)
    end

    # change notation when converting vector to string
    def to_s
        "(" + @x.to_s + ", " + @y.to_s + ")"
    end

    # check if two lines represented by vectors cross in 2d space
    # if the lines aren't parallel they cross
    def cross (other)
        !self.parallel(other)
    end

    # check if two vectors (or lines) are parallel to each other
    def parallel (other)
        @x * other.y == @y * other.x
    end

    # check if two vectors are perpendicular to each other
    def perp (other)
        @x * other.x + @y * other.y == 0
    end

    # check if two vectors are opposite to each other
    def opposite (other)
        len_t = (@x**2 + @y**2) ** 0.5
        len_o = (other.x**2 + other.y**2) ** 0.5
        @x * other.x + @y * other.y == len_t * len_o * -1
    end

end
