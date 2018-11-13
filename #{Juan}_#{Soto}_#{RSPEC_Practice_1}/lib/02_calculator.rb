def add(int1,int2)
   int1 + int2
end

def subtract(int1,int2)
  int1 - int2
end

def sum (array)
  return 0 if array.empty?
  array.inject(:+)
end
