def first_anagrams?(str_1, str_2) # O(n!)
    arr_1 = str_1.split("")
    arr_2 = str_2.split("")
    arr_1.permutation.include?(arr_2)
end

p first_anagrams?("gizmo", "sally") # => false
p first_anagrams?("elvis", "lives") # => true

def second_anagrams?(str1,str2) # O(n^2)
    arr1 = str1.split('')
    arr2 = str2.split('')

    arr1.each_with_index do |char1,i|
        arr2.each_with_index do |char2,j|
            if char1 == char2
                arr2.delete(char1)
            end
        end
    end
    return true if arr2.length == 0
    false
end

# p second_anagrams?("gizmo", "sally") # => false
# p second_anagrams?("elvis", "lives") # => true

def third_anagrams?(str_1, str_2) # O(n log n)
    str_1.split("").sort! == str_2.split("").sort!
end

# p third_anagrams?("gizmo", "sally") # => false
# p third_anagrams?("elvis", "lives") # => true

def fourth_anagrams?(str_1,str_2) # O(n)
     
    str_hash = {}
    str_1.each_char do |char|
        if !str_hash[char]
            str_hash[char] = 1
        else
            str_hash[char] += 1
        end
    end

    str_2.each_char do |char_2|
        if str_hash[char2]
            str_hash[char2] -= 1
        end
    end
    
    return false if !str_hash.has_value?(0)
    true
end

# p fourth_anagrams?("gizmo", "sally") # => false
# p fourth_anagrams?("elvis", "lives") # => true
