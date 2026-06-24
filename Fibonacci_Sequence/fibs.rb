def fibs(n)
  if n < 1
    return nil
  end
  result = [0]
  if n > 1
    result << 1
  end

  for i in 2...n do
    result << result[i-1] + result[i - 2]
  end

  result
end

puts "give me a number n ="
n = gets.chomp.to_i
p fibs(n)