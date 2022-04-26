# Monkey-Patch Ruby's existing Array class to add your own custom methods
require 'byebug'
class Array
    # Part 1
    def span
        largest = nil
        smallest = nil
        if self.length == 0
            return nil
        end
        self.each do |n|
            if largest == nil && smallest == nil
                largest = n
                smallest = n
            end
            if n > largest
                largest = n
            end
            if n < smallest
                smallest = n
            end
        end
        largest_difference = largest - smallest
        return largest_difference
    end

    def average
        sum = 0.0
        num_of_ele = self.length
        if num_of_ele == 0
            return nil
        end
        self.each do |ele|
            sum += ele
        end
        avg = sum / num_of_ele
    end

    def median
        if self.length == 0
            return nil
        end
        self.each do |ele|
            if self.length % 2 == 0
                sorted_arr = self.sort
                first_middle_i = (sorted_arr.length / 2) - 1
                second_middle_i = sorted_arr.length / 2
                sum = sorted_arr[first_middle_i] + sorted_arr[second_middle_i]
                return sum / 2.0
            else
                middle_ele = self.length / 2
                return self.sort[middle_ele]
            end
        end
    end

    def counts
        hash = Hash.new { |h, k| h[k] = [] }
        self.each do |ele|
            if !hash.has_key?(ele)
                hash[ele] = 1
            else
                hash[ele] += 1
            end
        end
        hash
    end

    # Part 2
    def my_count(value)
        count = 0
        self.each do |ele|
            if ele == value
                count += 1
            end
        end
        count
    end

    def my_index(value)
        self.each_with_index do |ele, i|
            if ele == value
                return i
            end
        end
        nil
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_transpose
        new_arr = []
        length = self[0].length
        (0...length).each do |i|
            subArr = []
            self.each do |sub_Arr|
                subArr << sub_Arr[i]
            end
            new_arr << subArr
        end
        new_arr
    end
end
