class Inversions
  def self.calc(data)
    c = 0
    n = data.count - 1
    puts "Processing array with #{n+1} items"
    
    for i in 0..n
      for j in i..n
        c = c + (data[i] > data[j] ? 1 : 0)
      end

      puts "i = #{i}" if i % 1000 == 0
    end

    c
  end
end

class DataReader
  def self.getData
    count = 100000
    int_array = []
    File.open("IntegerArray.txt") do |f|
      counter = 0
      while(l = f.gets and counter < count) do
        int_array << l.to_i
        counter = counter + 1
      end
    end

    int_array
  end
end

puts Inversions.calc(DataReader.getData)
