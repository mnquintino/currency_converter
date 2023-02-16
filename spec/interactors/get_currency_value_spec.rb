# frozen_string_literal: true

require 'rails_helper'

describe GetCurrencyValue do
  describe '.call' do
    let(:currency_one) { create(:currency, :brl) }
    let(:currency_two) { create(:currency, :usd) }
    let(:value) { 20 }
    let(:exchange_rate) { 0.18 }

    subject(:context) do
      described_class.call(origin_id: currency_one.id, destiny_id: currency_two, value: value)
    end

    context 'when the input is correct' do
      let(:money_exchange) { 3.6 }

      before do
        exchange_value = Struct.new(:exchange_rate).new
        exchange_value.exchange_rate = exchange_rate

        allow(CreateQuery).to receive(:call).and_return(exchange_value)
      end

      it 'returns the currency convertion' do
        expect(context.success?).to eq(true)
        expect(context.money_exchange).to eq(money_exchange)
      end
    end
  end
end