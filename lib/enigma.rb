require './lib/shift_generator'

class Enigma
  CHARACTER_SET = ("a".."z").to_a << " "

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

    { encryption: decrypted_message, key: key, date: date }
  end

  private

  def encrypt_letter(index, letter, shifts)
    letter_position = CHARACTER_SET.index(letter.downcase)
    shifted_position = letter_position + shifts[index % shifts.length]
    CHARACTER_SET[shifted_position % CHARACTER_SET.length]
  end

  def decrypt_letter(index, letter, shifts)
    letter_position = CHARACTER_SET.index(letter)
    shifted_position = letter_position - shifts[index % shifts.length]
    CHARACTER_SET[shifted_position % CHARACTER_SET.length]
  end
end
