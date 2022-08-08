class Enigma
  CHARACTER_SET = ("a".."z").to_a << " "

  def encrypt(message, key = nil, date = nil)
    key ||= KeyGenerator.generate
    date ||= Date.today.strftime("%d%m%y")

    shifts = generate_shift(key, date)

    encrypted_message = message.chars.map.with_index { |letter, index| encrypt_letter(index, letter, shifts) }.join

    { encryption: encrypted_message, key: key, date: date }
  end

  def decrypt(ciphertext, key, date = nil)
    date ||= Date.today.strftime("%d%m%y")

    shifts = generate_shift(key, date)

    decrypted_message = ciphertext.chars.map.with_index do |letter, index|
      letter_position = CHARACTER_SET.index(letter)
      shifted_position = letter_position - shifts[index % shifts.length]
      CHARACTER_SET[shifted_position % CHARACTER_SET.length]
    end.join

    { encryption: decrypted_message, key: key, date: date }
  end

  private

  def encrypt_letter(index, letter, shifts)
    letter_position = CHARACTER_SET.index(letter.downcase)
    shifted_position = letter_position + shifts[index % shifts.length]
    CHARACTER_SET[shifted_position % CHARACTER_SET.length]
  end

  def generate_shift(key, date)
    ka, kb, kc, kd = key[..1], key[1..2], key[2..3], key[3..4]
    oa, ob, oc, od = OffsetGenerator.generate(date)
    [
      ka.to_i + oa.to_i,
      kb.to_i + ob.to_i,
      kc.to_i + oc.to_i,
      kd.to_i + od.to_i
    ]
  end
end
