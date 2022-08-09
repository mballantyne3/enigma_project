require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  it 'generates an array' do
    shift = ShiftGenerator.generate

    expect(shift).to be_a(Array)
  end
end
