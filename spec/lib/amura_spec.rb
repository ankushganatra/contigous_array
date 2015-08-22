require_relative '../../lib/amura'

describe Amura::Amura do

  it 'should find contiguous array from given array' do
    amura = Amura::Amura.new([-2, 1, -3, 4, -1, 2, 1, -5])
    expect(amura.result).to eq([4, -1, 2, 1])
    expect(amura.sum).to eq(6)
    expect(amura.start_index).to eq(3)
    expect(amura.length).to eq(4)
  end

end