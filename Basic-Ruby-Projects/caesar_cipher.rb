def caesar_cipher(text, shift)
  encrypted = ''
  if text.length != 0
    text.each_char do |letter|
      if letter.between?('a', 'z')
        new_letter = (((letter.ord - 97 + shift) % 26) + 97).chr
        encrypted += new_letter
      elsif letter.between?('A', 'Z')
        new_letter = (((letter.ord - 65 + shift) % 26) + 65).chr
        encrypted += new_letter
      else
        encrypted += letter
      end
    end
  end
  encrypted
end

puts caesar_cipher('What a string!', 5)
