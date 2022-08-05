require './lib/key_generator'

RSpec.describe KeyGenerator do
  it 'generates a key' do
    key = KeyGenerator.generate

    expect(key).to be_a(String)
    expect(key.length).to eq 5
  end
end
