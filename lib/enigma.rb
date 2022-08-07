class Enigma

  def encrypt(message, key = nil, date = nil)
    key ||= KeyGenerator.generate
    date ||= Date.today.strftime("%d%m%y")

    ka, kb, kc, kd = key[..1], key[1..2], key[2..3], key[3..4]
    oa, ob, oc, od = OffsetGenerator.generate(date)
    shifts = [
      ka.to_i + oa.to_i,
      kb.to_i + ob.to_i,
      kc.to_i + oc.to_i,
      kd.to_i + od.to_i
    ]

    character_set = ("a".."z").to_a << " "

    encrypted_message = message.chars.map.with_index do |letter, i|
      letter_position = character_set.index(letter)
      shifted_position = letter_position + shifts[i % shifts.length]
      character_set[shifted_position % character_set.length]
    end.join

    { encryption: encrypted_message, key: key, date: date }
  end

  # def decrypt(decryption, key, date)
  #   decrypted_code = Hash.new
  #   decrypted_code[decryption] = the decrypted String
  #   decrypted_code[] = the key used for decryption as a String
  #   decrypted_code[] = the date used for decryption as a String DDMMYY
  # end

  def keys

  end
end
