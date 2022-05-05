require 'byebug'
def range(start, last)
    return [] if last <= start
    return [start] if start + 1 == last

    [start] << range(start + 1, last)    
end

# p range(1, 5)
# p range (1, 2)
# p range (1, 3)

def rec_1(b, n)
    return 1 if n == 0
    b * rec_1(b, n - 1)
end

# p rec_1(2, 3) # 8
# p rec_1(2, 4) # 16
# p rec_1(2, 6) # 64

def rec_2(b, n)
    return 1 if n == 0
    return b if n == 1
    if n % 2 == 0
        b * rec_2(b, n - 1)
    else
        b * (rec_2(b, (n - 1) / 2) ** 2)
    end
end

# p rec_2(2, 3) # 8
# p rec_2(2, 4) # 16
# p rec_2(2, 6) # 64

def dup(arr) #not done
    return [arr[0]] if !arr[0].is_a?(Array)
    
    dupe_arr = []

    arr.each do |ele|
        if ele.is_a?(Array)
            dupe_arr += dup(ele)
        else
            dupe_arr << ele
        end
    end
    dupe_arr
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# p dup(robot_parts)

def fibonacci(n)
    return [0] if n == 1
    return [0, 1] if n == 2
    prev = fibonacci(n - 1) 
    prev << prev[-1] + prev[-2]
end

# p fibonacci(8) # [0, 1, 1]

def bsearch(arr, target)
    mid = arr.length / 2

    return mid if arr[mid] == target
    return nil if arr.length == 0

    left = arr[0...mid]
    right = arr[mid + 1..-1]
    if arr[mid] > target
        bsearch(left, target)
    else
        stack = bsearch(right, target)
        if stack != nil
            bsearch(right, target) + left.length + 1
        else
            return nil
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr) # not done
    return [] if arr.length == 0
    return arr if arr.length == 1

    mid = arr.length / 2

    left = arr[0...mid] #[1]
    right = arr[mid..-1] #[2]

    if left.length > 1
        merge_sort(left)
    end

    if right.length > 1
        merge_sort(right)
    end
    # [separate(left), separate(right)]

end

def merge(arr_1, arr_2) #[1, 3], [2, 4]
    # if arr_1[0] > arr_2[0]
    #     arr << arr_2[0]
    #     arr << arr_1[0]
    # else
    #     arr << arr_1[0]
    #     arr << arr_2[0] 
    # end
    # arr
    arr = []
    arr_1.each do |ele1|
        arr_2.each do |ele2|
            if ele1 < ele2
                arr << ele1
                arr_1.shift
            elsif ele2 < ele1
                arr << ele2
                arr_2.shift
            else
                if arr_1.length == 0
                    arr << ele2
                end
                if arr_2.length == 0
                    arr << ele1
                end
            end
        end
    end
    arr
end

# p separate([1, 2, 3, 5])

def combo(str)
    str_arr = str.split("")
    arr = []
    str_arr.each_with_index do |ele1, i1|
        str_arr.each_with_index do |ele2, i2|
            if i1 == i2
                arr << [ele1]
            elsif i2 > i1
                arr << str_arr[i1..i2]
            end
        end
    end
    arr
end

# p combo("jump")

def subsets(arr)
    return [arr] if arr.length == 0
    return [[], arr] if arr.length == 1
    new_arr = []
    new_arr << arr
    new_arr << [arr.pop]
    subsets(arr)

# subset([]) => [[]]
# subset([1]) => [[], [1]]
# subset([]) << [1]
# subset([1, 2]) => [[], [1], [2], [1,2]]
# subset([1]) << subset[-2]


end

# p subsets([])
# p subsets([1]) #[[], [1]]
p subsets([1, 2]) #[[], [1], [2], [1,2]]

#[] << [1,2]
#[] << [1,2].pop == 2
# [[1,2], [2]] 