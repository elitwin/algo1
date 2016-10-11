def read_array(file, count)
  int_array = []
  File.open(file) do |f|
    counter = 0
    while (l = f.gets and counter < count ) do
      int_array << l.to_i
      counter += 1
    end

  end
  return int_array
end

def merge(a, b)
 merged_array = []

 i = 0
 j = 0

 inversions = 0

 for k in 0...(a.size + b.size) do

     if (a[i] != nil and b[j] != nil and a[i] <= b[j] or (a[i] != nil and b[j] == nil))
        merged_array << a[i]
        i += 1
     else
        merged_array << b[j]
        j += 1

        inversions += (a.size - i)
     end
 end

 return merged_array, inversions
end

def sort(i_array)

  if (i_array.size == 1)
    return i_array, 0
  end

  split = i_array.size / 2;

  first_sorted_part, first_inversions = sort(i_array[0...split])
  second_sorted_part, second_inversions = sort(i_array[split...i_array.size])

  merged_array, merge_inversions = merge(first_sorted_part, second_sorted_part)

  return merged_array, (first_inversions + second_inversions + merge_inversions)
end


puts "Fast Inversion Counter"
int_array = read_array("IntegerArray.txt", 100000)

start = Time.now
sorted_array, num_inversions = sort(int_array)
endTime = Time.now

puts "Number of inversions = #{num_inversions}"
puts "Program run time: #{endTime - start} seconds"
