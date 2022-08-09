require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  it 'generates a shift and returns the key and date' do
    shift, key, date = ShiftGenerator.generate("02715", "090892")

    expect(shift).to eq([7, 33, 77, 19])
    expect(key).to eq("02715")
    expect(date).to eq("090892")
  end

  it 'generates keys and dates if you dont pass them' do
    allow(Date).to receive(:today).and_return(Date.parse('1992-08-09'))
    allow(KeyGenerator).to receive(:generate).and_return('02715')

    shift, key, date = ShiftGenerator.generate
    expect(date).to eq('090892')
    expect(key).to eq('02715')
  end
end
