RSpec.describe Exchange::Api::Converter do
  specify '#convert' do
    converter_stub = double Exchange::Api::Converter

    allow(converter_stub).to receive(:convert).with(sum: 80).and_return(100)

    expect(converter_stub.convert(sum: 80)).to eq(100)

    expect(converter_stub).to have_received(:convert).with(sum: 80).once
  end
end