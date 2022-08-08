require '../spec/spec_helper'
require './lib/enigma'
require 'date'

RSpec.describe Enigma do

  let(:enigma) { Enigma.new }

  it 'exists' do
    expect(enigma).to be_a(Enigma)
  end

  it 'can encrypt a message with a key and date' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(
      {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    )
  end

  it 'can encrypt a message without a key and date' do

    allow(Date).to receive(:today).and_return(Date.parse('2022-08-07'))
    allow(KeyGenerator).to receive(:generate).and_return('02341')
    expect(enigma.encrypt("hello world")).to eq(
      {
      encryption: "og cvbkfyns",
      key: "02341",
      date: "070822"
      })
  end

  it 'can decrypt an encrypted text' do

    expect(enigma.decrypt("og cvbkfyns", "02341", "070822")).to eq(
      {
        encryption: "hello world",
        key: "02341",
        date: "070822"
      })
  end

  it 'can decrypt an encrypted test without a date' do

    allow(Date).to receive(:today).and_return(Date.parse('2022-08-07'))
    expect(enigma.decrypt("og cvbkfyns", "02341")).to eq(
      {
        encryption: "hello world",
        key: "02341",
        date: "070822"
      })
  end
end
