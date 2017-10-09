require 'warmup'

describe Warmup do

  let(:warmup) { Warmup.new }

  describe '#gets_shout' do

    subject { warmup.gets_shout }

    before(:each) do
      allow(warmup).to receive(:gets).and_return('abc')
      allow(STDOUT).to receive(:puts)
    end

    it 'receives input and returns it in caps' do
      expect(subject).to eq('ABC')
    end

    it "receives input and 'puts' it out in reverse" do
      expect{ subject }.to output("CBA\n").to_stdout
    end
  end

  describe '#triple_size' do
    let(:arr) { double('Array Double', size: 2) }
    it 'returns an integer 3x the length of an array' do
      expect(warmup.triple_size(arr)).to eq(6)
    end
  end

  describe '#calls_some_methods' do
    let(:str) { 'abc' }

    before do
      allow(str).to receive(:upcase!).and_return(str) #returning str overwrites 'abc' with 'ABC'
      allow(str).to receive(:reverse!).and_return('CBA')
    end

    it 'raises an error if the input is empty' do
      expect { warmup.calls_some_methods('') }.to raise_error("Hey, give me a string!")
    end

    it 'receives the #upcase! method call' do
      expect(str).to receive(:upcase!)
      warmup.calls_some_methods(str)
    end

    it 'receives the #reverse! method call' do
      expect(str).to receive(:reverse!)
      warmup.calls_some_methods(str)
    end

    it 'returns a different object than what was passed in' do
      expect(str.object_id).not_to eq(warmup.calls_some_methods(str).object_id)
    end
  end

end
