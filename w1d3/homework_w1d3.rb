require 'byebug'

def sum_to(num)
  return num if num <= 1
  return nil if num < 0
  num + sum_to(num - 1)
end

def add_numbers(arr)
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  return num if num == 1
  return nil if num <= 0
  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return true if favorite == flavors[0]
  return false if flavors.length <= 1
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end
