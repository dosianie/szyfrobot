class Rot13
  LOWER_LETTERS = [
    'a', 'ą', 'b', 'c', 'ć',
    'd', 'e', 'ę', 'f', 'g',
    'h', 'i', 'j', 'k', 'l',
    'm', 'n', 'ń', 'o', 'ó',
    'p', 'q', 'r', 's', 'ś',
    't', 'u', 'v', 'w', 'x',
    'y', 'z', 'ż', 'ź'
  ]

  UPPER_LETTERS = LOWER_LETTERS.map(&:upcase)

  DIGITS = ['0', '1', '2', '3', '4',
            '5', '6', '7', '8', '9']

  def self.decode(string)
    string.chars.map do |char|
      try_encode(char, LOWER_LETTERS) ||
      try_encode(char, UPPER_LETTERS) ||
      try_encode(char, DIGITS) ||
      char
    end.join('')
  end

  def self.encode(string)
    string.chars.map do |char|
      try_decode(char, LOWER_LETTERS) ||
      try_decode(char, UPPER_LETTERS) ||
      try_decode(char, DIGITS) ||
      char
    end.join('')
  end

  private

  def self.try_decode(char, charset)
    return nil unless charset.include?(char)
    new_pos = (charset.index(char) + 13) % charset.size
    charset[new_pos]
  end

  def self.try_encode(char, charset)
    return nil unless charset.include?(char)
    new_pos = (charset.index(char) - 13) % charset.size
    charset[new_pos]
  end
end