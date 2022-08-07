require './lib/offset_generator'
require 'date'

RSpec.describe OffsetGenerator do
  it 'generates an offset' do
    offset = OffsetGenerator.generate("090892")

    expect(offset).to eq(["5", "6", "6", "4"])
  end
end
