RSpec.describe Exchange::Utils::Uid do
  let(:dummy) { Class.new { include Exchange::Utils::Uid }.new }

  describe '#hash' do
    it 'returns string when at least 1 arg were given' do
      expect(dummy.hash('John', 'Doe')).to be_an_instance_of(String)
    end

    it 'returns nil when no args were given' do
      expect(dummy.hash).to be_nil
    end
  end
end