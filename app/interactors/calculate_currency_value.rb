# frozen_string_literal: true
require '/home/manara/Mentoria/Projeto_2/currency_converter/lib/currency_api/client.rb'
require 'interactor'

class CalculateCurrencyValue
  include Interactor

  delegate :query, :value, to: :context

  def call
    context.response = calculate_currency
  rescue => e
      context.fail!(errors: e.message)
  end

  private

  def calculate_currency
    @calculate_currency ||= (value * response).round(2)
  end

  def response
    response = request
    if response.success?
      response.first[1]
    else
      "API indisponível"
    end
  end

  def request
    @request ||= CurrencyApi::Client.new.request(query)
  end
end