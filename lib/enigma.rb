require './lib/shift_generator'

class Enigma
  CHARACTER_SET = ("a".."z").to_a << " "
  SPECIAL_CHARACTERS = "!@#$%^&*()_-{}[]''?><\\/.,+="

  def encrypt(message, key = nil, date = nil)
    shifts, key, date = ShiftGenerator.generate(key, date)

    encrypted_message = message.chars.map.with_index do |letter, index|
      encrypt_letter(index, letter, shifts)
    end.join

    { encryption: encrypted_message, key: key, date: date }
  end

  def decrypt(ciphertext, key, date = nil)
    shifts, key, date = ShiftGenerator.generate(key, date)

    decrypted_message = ciphertext.chars.map.with_index do |letter, index|
      decrypt_letter(index, letter, shifts)
    end.join

    { decryption: decrypted_message, key: key, date: date }
  end

  private

  def encrypt_letter(index, letter, shifts)
    return letter if SPECIAL_CHARACTERS.include?(letter) # we don't encrypt special characters
    current_shift = shifts[index % shifts.length] # selects A, B, C, or D (with wrapping back to A)
    letter_position = CHARACTER_SET.index(letter.downcase) # numeric position of our letter
    letter_position += current_shift # add the current shift
    letter_position %= CHARACTER_SET.length # wrap back to the beginning of the alphabet, if necessary
    CHARACTER_SET[letter_position] # grab that character
  end

  def decrypt_letter(index, letter, shifts)
    return letter if SPECIAL_CHARACTERS.include?(letter)
    letter_position = CHARACTER_SET.index(letter.downcase)
    letter_position -= shifts[index % shifts.length]
    CHARACTER_SET[letter_position % CHARACTER_SET.length]
  end
end
