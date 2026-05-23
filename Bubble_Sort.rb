def bubble_sort(array)
  for i in 1..(array.length - 1)
    for j in 0..(array.length - i - 1)
      array[j], array[j + 1] = array[j + 1], array[j] if array[j] > array[j + 1]
    end
  end
  array
end

p bubble_sort([4, 3, 78, 2, 0, 2])
