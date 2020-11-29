def merge(array1, array2, merged = [])
  a1_length = array1.length 
  a2_length = array2.length
  until merged.length == a1_length + a2_length
      if array1 == []
          merged << array2
          merged = merged.flatten
      elsif array2 == []
          merged << array1
          merged = merged.flatten
      elsif array1.first < array2.first 
          merged << array1.first 
          array1 = array1.drop(1)
      elsif array1.first > array2.first
          merged << array2.first
          array2 = array2.drop(1)
      elsif array1.first == array2.first 
          merged << array1.first 
          merged << array2.first 
          array1 = array1.drop(1)
          array2 = array2.drop(1)
      end
  end 
  merged
end 

def merge_sort(array)
  if array.length <= 1
      array
  else
      halves = array.each_slice( (array.size / 2.0).round ).to_a

      left_sorted = merge_sort(halves[0])
      right_sorted = merge_sort(halves[1])
      
      merge(left_sorted, right_sorted)
  end 
end

random_array = []; 20.times { random_array << rand(100)}

p random_array
puts "#{merge_sort(random_array)} sorted"