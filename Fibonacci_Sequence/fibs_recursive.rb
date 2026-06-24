def fibs_recursive(n)
  return nil if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2
  result = fibs_recursive(n - 1)

  result << result[-1] + result[-2]

end

p fibs_recursive(8)