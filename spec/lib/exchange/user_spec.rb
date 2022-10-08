# frozen_string_literal: true

RSpec.describe Exchange::User do
  let(:user) { |ex| described_class.new(ex.metadata[:name] || 'John', 'Doe') }

  it 'returns name', name: 'Bob' do
    expect(user.name).to eq('Bob')
  end

  it 'returns surname' do
    expect(user.surname).to eq('Doe')
  end

  specify '#account' do
    expect(user.account).to be_an_instance_of(Exchange::Account)
  end

  it 'has zero balance by default' do
    expect(user.balance).to be_zero
  end
end
