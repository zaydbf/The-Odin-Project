def substrings(text, dict)
  text = text.downcase
  hash = Hash.new(0)
  dict.each do |element|
    n = text.scan(element).length # convert the element found in the string into a list : text = "how abhow how"  ==> text.scan("how") = ["how", "how", "how"]
    hash[element] += n if n > 0
  end
  hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings('below', dictionary)

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
