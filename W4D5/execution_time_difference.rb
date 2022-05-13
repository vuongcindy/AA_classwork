require 'byebug'
#my_min
#phase 1 - BigO: O(n^2)
def my_min(list)
    smallest_num = nil
     list.each_with_index do |ele1,i1|
        list.each_with_index do |ele2,i2|
            if smallest_num == nil 
                smallest_num = ele1
            elsif i1 < i2 && smallest_num > ele2
                 smallest_num = ele2
            end
        end
    end
   smallest_num
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#phase 2 - BigO: O(n)
def my_min2(list)
    min = nil
    list.each do |ele|
        if min == nil || ele < min
            min = ele
        end
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

#largest_contiguous_sub_sum

#phase 1 - BigO: O(n^2)
def largest_contiguous_sub_sum(list)
    greatest_sum = [list[0]]
    (0...list.length).each do |i|
        (i...list.length).each do |j|
            if greatest_sum.sum < list[i..j].sum
                greatest_sum = list[i..j]
            end
        end
    end
    greatest_sum.sum
end

# phase 2 - BigO: O()
def largest_contiguous_sub_sum_2(list)
    largest_sum = list[0]
    current_sum = list[0]
    list[1..-1].each_with_index do | ele, i | 
        # debugger
        if current_sum + ele > current_sum
            current_sum = current_sum + ele
            # largest_sum = current_sum + ele
            if current_sum > largest_sum
                largest_sum = current_sum
            end
        elsif current_sum + ele < current_sum && current_sum + ele > 0
            current_sum = ele + current_sum
            if current_sum > largest_sum
                largest_sum = current_sum
            end
        elsif current_sum + ele < 0 
            current_sum = 0
            if largest_sum < ele
                largest_sum = ele
            end
        end
    end
    largest_sum
end

# list = [5, 3, -7]
# p largest_contiguous_sub_sum_2(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_sub_sum_2(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_sub_sum_2(list) # => -1 (from [-1])