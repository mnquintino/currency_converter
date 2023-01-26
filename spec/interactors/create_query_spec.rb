# frozen_string_literal: true

require 'rails_helper'

describe CreateQuery do
  describe '.call' do
    let!(:credentials) { 'api_key' }
    let!(:query) { 'BRL_USD' }
    let(:currency_api_url) { "https://free.currconv.com/api/v7/convert?q=#{query}&compact=ultra&apiKey=#{credentials}" }

    context 'when the params are correct' do
      let(:currency_one) { create(:currency, :brl) }
      let(:currency_two) { create(:currency, :usd) }
      let(:value) { 0.18595 }
      let(:exchange_rate) { ['BRL_USD', value] }
      let(:response_body) do
        double(
          :context, success?: true, first: exchange_rate
        )
      end

      subject(:context) do
        described_class.call(origin_id: currency_one.id, destiny_id: currency_two.id)
      end

      it 'returns the exchange rate' do
        expect_any_instance_of(CurrencyApi::Client).to receive(:request).with(query).and_return(response_body)

        expect(context.success?).to eq(true)
        expect(context.exchange_rate).to eq(value)
      end
    end

    context 'when the params do not exist' do
      let(:currency_one) { create(:currency, :brl) }
      let(:currency_two) { 0 }
      let(:param_not_found) { 'ID não encontrado' }

      subject(:context) do
        described_class.call(origin_id: currency_one.id, destiny_id: currency_two)
      end

      it 'returns nil' do
        expect(context.success?).to eq(false)
        expect(context.errors).to eq(param_not_found)
        expect(context.exchange_rate).to eq(nil)
      end
    end
  end
end
