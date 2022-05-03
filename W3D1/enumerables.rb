# my each
require 'byebug'

class Array
   
    def my_each(&element) #or prc
        i_2 = 0
        while i_2 < 2
            i = 0
            while i < self.length
                element.call(self[i])
                i += 1
            end
            i_2 += 1
        end
    end

    def my_select(&element)
        result = []
        i = 0
        while i < self.length
            if element.call(self[i]) #
                result << self[i] #[2,3]
            end
            i += 1
        end
        result
    end

    def my_reject(&block)
        result = []
        i = 0
        while i < self.length
            if !block.call(self[i])
                result << self[i]
            end
           i += 1
        end
        result
    end

    def my_any?(&block)
        i = 0
        while i < self.length
            if block.call(self[i]) == true
                return true
            end
            i += 1
        end
        return false
    end

    def my_all?(&block)
        i = 0
        count = 0
        while i < self.length
            if block.call(self[i]) == true
                count += 1
            end
            i += 1
        end
            if count == self.length
                return true
            else
                return false
            end
    end

    def my_flatten
        #[1, 2, 3, [4, [5, 6]], [[[7]], 8]]
        return [self] if !self.is_a?(Array)
        #[1][2][3]
        array = [] #[1][2][3]
        self.each do |value| 
             #[4, [5, 6]], [[[7]], 8]
            #is not an array
            if !value.is_a?(Array) 
                array << value
            else    #is an array
                array += value.my_flatten
            end
           
        end
        array #[1, 2, 3]
    end

    def my_zip(*args) #[1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
        # a = [ 4, 5, 6 ]
        # b = [ 7, 8, 9 ]
        output_arr = []
        
        self.each_with_index do |ele, idx|
            output_arr << [ele] #[[1], [2], [3]]
        end
        args.each_with_index do |ele1, idx1| # ele1 = array a
            self.each_with_index do |ele, idx| 
                output_arr[idx] << ele1[idx] #[[1], [2], [3]]
            end
        end
        output_arr #[[1, 4, 7], [2, 5, 8]]
    end


    def my_rotate(n=1)
    brick = self.map {|ele| ele}
        if n > 0
            #rotate to left
            n.times do 
                val = brick[0] 
                brick.shift 
                brick.push(val) 
            end
        elsif n < 1
            num = n.abs
            num.times do
                val = brick[-1]
                brick.pop
                brick.unshift(val)
            end
        end
        return brick
    end


end #lastend

# prc = Proc.new {|ele| p ele }
    #block

#     #[problem1]
# arr_1 = [1, 2, 3]
# p arr_1.my_each {|ele| p ele }

#problem2
# arr_1 = [1, 2, 3]
# p arr_1.my_select { |element| element > 1 }
# p arr_1.my_select { |num| num == 4 }

#problem3
# arr_1 = [1, 2, 3]
# p arr_1.my_reject { |element| element > 1 }
# p arr_1.my_reject { |num| num == 4 }

#problem4
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

#problem5
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

#problem6
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# # [ [self[0], a[0], b[0] 
# #   [self[1], a[1], b[1] 
# #   [self[2], a[2], b[2]  ]
# # .my_zip(*args)

# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# problem 7
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]