# frozen_string_literal: true
require 'rails_helper'
describe CalculateCurrencyValue do
  describe '.call' do
    let(:origin) { double(:currency, id: 1, initials: "BRL" ) }
    let(:destiny) { double(:currency, id: 2, initials: "USD") }
    let(:value) { 20 }
    let(:query) { "BRL_USD"}
    let(:exchange_rate) { 0.18 }
    let(:response_body) { { 'exchange_rate' => exchange_rate } }

    subject(:context) do
      described_class.call(origin_id: origin.id, destiny_id: destiny.id, value: value)
    end

    context 'when the input is correct' do
      let(:money_exchange) { 3.60 }

      it 'returns the currency convertion' do

        # expect_any_instance_of(CurrencyApi::Client).to receive(:request).with(query).and_return(response_body)
        allow(response_body).to receive(:[]).with('exchange_rate').and_return(['exchange_rate'])
        allow(CreateQuery).to receive(:call).and_return(exchange_rate)

        expect(context.success?).to eq(true)

        expect(context.money_exchange).to eq(money_exchange)
      end
    end
    
  end
end
