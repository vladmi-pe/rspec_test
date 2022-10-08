RSpec.describe Exchange::Account do
  let(:user_class) { Struct.new(:name, :surname) }
  let(:account1) { described_class.new(user_class.new('John', 'Doe')) }
  let(:account2) { described_class.new(user_class.new('Ann', 'Smith')) }

  fit 'has zero balance by default' do
    expect(account1.balance).to be_zero
  end

  it 'has proper uid' do
    hash = account1.hash 'John', 'Doe'

    expect(account1.uid).to eq(hash)
  end

  context 'when performing transfer' do
    before { account1.deposit(100) }

    specify '#transfer' do
      account1.transfer(account2, 40)

      expect(account1.balance).to eq(60)
      expect(account2.balance).to eq(40)
    end

    specify '#transfer_with_conversion' do
      allow(account1).to receive(:convert).with(sum: 40, from: :usd, to: :eur).and_return(50)
      account1.transfer_with_conversion(account2, 40, :usd, :eur)

      expect(account1.balance).to eq(60)
      expect(account2.balance).to eq(50)
    end

    describe '#withdraw' do
      it 'allows  to withdraw correct sum' do
        account1.withdraw(40)

        expect(account1.balance).to eq(60)
      end

      it 'does not allow to withdraw sum that is too large' do
        expect { account1.withdraw(120) }.to raise_error(Exchange::NotEnoughFunds)
      end

      it 'does not allow to withdraw negative sum' do
        expect { account1.withdraw(-20) }.to raise_error(Exchange::IncorrectSum)
      end
    end
  end
end