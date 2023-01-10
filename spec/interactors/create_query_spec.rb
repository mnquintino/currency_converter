# frozen_string_literal: true

require 'rails_helper'

describe CreateQuery do
  describe '.call' do
    context 'when the params are correct' do
      # let!(:currency_one) do
      #   double(
      #     id: 1, initials: 'BRL', name: 'Real'
      #   )
      # end

      # let!(:currency_two) do
      #   double(
      #     id: 2, initials: 'USD', name: 'Dólar Americano'
      #   )
      # end

      # let!(currency_one) { create(:currency, :brl) }
      # let!(currency_two) { create(:currency, :usd) }

      let!(:credentials) { "api_key" }
      let!(:query) { "BRL_USD" }
      let(:exchange_rate) { 0.18595 }
      let(:response_body) do
        double(
          :context, success?: true, exchange_rate: exchange_rate
        )
      end
      
      let(:currency_api_url) { "https://free.currconv.com/api/v7/convert?q=#{query}&compact=ultra&apiKey=#{credentials}" }

      # before do
      #   expect(currency_one).to receive(:find).with('1').and_return(currency_one.initials)
      #   expect(currency_two).to receive(:find).with('2').and_return(currency_two.initials)
      # end
      
      subject(:context) do
        described_class.call(origin_id: currency_one.id, destiny_id: currency_two.id)
      end

      xit 'returns the exchange rate' do
        expect_any_instance_of(CurrencyApi::Client).to receive(:request).with(query).and_return(response_body)

        expect(context.exchange_rate).to eq(exchange_rate)
      end
    end

    context 'when the params do not exist' do
      let!(:credentials) { "api_key" }
      let!(:query) { "BRL_USD" }
      let(:errors) { 'API indisponível' }
      let(:currency_api_url) { "https://free.currconv.com/api/v7/convert?q=#{query}&compact=ultra&apiKey=#{credentials}" }

      let(:currency_one) { create(:currency, :brl) }
      let(:currency_two) { create(:currency, :usd) }

      # let(:client) { double(CurrencyApi::Client) }
      
      subject(:context) do
        described_class.call(origin_id: currency_one.id, destiny_id: currency_two.id)
      end

      before do
        allow(CurrencyApi::Client).to receive(:new).and_raise(RuntimeError, 'API indisponível')
        # allow(CurrencyApi::Client).to receive(:new) { :success }
        # allow(CurrencyApi::Client.new).to receive(:request).with(query).and_return(:success)

        # allow(CurrencyApi::Client).to receive(:call).with(query).and_raise('API indisponível')
        # allow(obj).to receive(:message).and_throw(:this_symbol)

        # expect(double).to receive(:msg).and_raise(error)
        # `error` can be an instantiated object (e.g. `StandardError.new(some_arg)`) or a class (e.g. `StandardError`)
        # if it is a class, it must be instantiable with no args
        # expect(double).to receive(:msg).and_throw(:msg)
      end

      # it 'returns the exchange rate' do
        it { expect(context).to raise_error RuntimeError }
        # expect_any_instance_of(CurrencyApi::Client).to receive(:request).with(query)

        # expect(context).to eq(RuntimeError('API indisponível'))
        # binding.pry
        # expect(context.success?).to be_falsey
        # expect(context.errors).to eq(errors)
      # end
    end
  end
end
