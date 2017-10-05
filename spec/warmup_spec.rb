require 'warmup'

describe Warmup do

  let(:warmup) { Warmup.new }

  describe '#gets_shout' do

    before(:each) do
      allow(warmup).to receive(:gets).and_return('abc')
      allow(STDOUT).to receive(:puts)
    end

    subject { warmup.gets_shout }

    it 'receives input and returns it' do
      expect(subject).to eq('ABC')
    end

    it 'receives input and shouts it back' do
      expect{ subject }.to output("CBA\n").to_stdout
    end
  end

end
