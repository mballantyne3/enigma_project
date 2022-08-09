require 'date'
require './lib/key_generator'
require './lib/offset_generator'

module ShiftGenerator
  def self.generate(key = nil, date = nil)
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

    [shifts, key, date]
  end
end


