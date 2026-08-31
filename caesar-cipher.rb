$alphabet_start = 'a'.ord
$alphabet = 'abcdefghijklmnopqrstuvwxyz'

def encrypt_char(char, offset)
  if(char == " ")
    return " "
  end
  value = char.ord + offset - $alphabet_start
  $alphabet[value]
end

def caesar_cipher(original, offset)
  original.gsub (/./) { |c| encrypt_char c, offset }
end

puts caesar_cipher("a hello 2 world z", -3)
