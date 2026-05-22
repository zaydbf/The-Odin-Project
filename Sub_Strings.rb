def substrings(text, dict)
  text = text.downcase
  hash = Hash.new(0)
  dict.each do |element|
    n = text.scan(element).length # convert the element found in the string into a list : text = "how abhow how"  ==> text.scan("how") = ["how", "how", "how"]
    if n > 0
      hash[element] += n
    end
  end
  return hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)

puts substrings("Howdy partner, sit down! How's it going?", dictionary)