class Vector3

    # make x, y and z components publicly accessable
    attr_accessor :x, :y, :z
    # set counter of amount of 'Vector3' objects to zero
    @@count = 0

    def initialize (x, y, z)
        # define x, y and z components to vector
        @x = x
        @y = y
        @z = z
        # add 1 to the counter of initiated 'Vector3' ojects
        @@count += 1
    end

    # count the amount of 'Vector3' objects initiated
    def self.count
        @@count
    end

    # add something to a vector
    def + (other)
        # add 2 vectors together
        if other.instance_of?(Vector3)
            Vector3.new(@x + other.x, @y + other.y, @z + other.z)
        # add a number to a vector
        else
            Vector3.new(@x + other, @y + other, @z + other)
        end
    end

    # subtract
    def - (other)
        # subtract 2 vectors
        if other.instance_of?(Vector3)
            Vector3.new(@x - other.x, @y - other.y, @z - other.z)
        # subtract a number from a vector
        else
            Vector3.new(@x - other, @y - other, @z - other)
        end
    end

    # multiply two vectors, getting a number out of it
    # OR multiply a vector with a fixed number, getting a vector
    def * (other)
        # multiply 2 vectors
        if other.instance_of?(Vector3)
            @x * other.x + @y * other.y + @z * other.z
        # multiply a number with a vector
        else
            Vector3.new(@x * other, @y * other, @z * other)
        end
    end

    # devide a vector with a number
    def / (other)
        Vector3.new(@x / other, @y / other, @z / other)
    end

    # checks if two vectors are exactly the same by comparing 'x', 'y' and 'z'
    #   components of the vectors
    def == (other)
        @x == other.x && @y = other.y && @z = other.z
    end

    # 'less than' operator compares two lengths of vectors
    def < (other)
        (@x**2 + @y**2 + @z**2) ** 0.5 < (other.x**2 + other.y**2 + other.z**2)
    end

    # 'more than' operator compares two lengths of vectors
    def > (other)
        (@x**2 + @y**2 + @z**2) ** 0.5 > (other.x**2 + other.y**2 + other.z**2)
    end

    # change notation when converting verctor to string
    def to_s
        "(" + @x.to_s + ", " + @y.to_s + ", " + @z.to_s + ")"
    end

    # check if two vectors (or lines) are parallel to each other
    def parallel (other)
        ax = @x * other.y * other.z
        ay = other.x * @y * other.z
        az = other.x * other.y * @z
        ax == ay && ay == az
    end

end
