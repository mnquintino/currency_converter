# frozen_string_literal: true

require 'rails_helper'

describe CalculateCurrencyValue do
  describe '.call' do
    let(:value) { 20 }
    let(:response_body) { { 'exchange_rate' => exchange_rate } }
    let(:create_query_result) { 0.18595 }

    subject(:context) do
      described_class.call(value: value, exchange_rate: create_query_result)
    end

    context 'when the input is correct' do
      let(:money_exchange) { 3.72 }

      it 'returns the currency convertion' do
        expect(context.success?).to eq(true)
        expect(context.money_exchange).to eq(money_exchange)
      end
    end
  end
end

