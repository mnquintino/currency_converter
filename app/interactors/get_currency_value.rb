# frozen_string_literal: true

class GetCurrencyValue
  include Interactor

  delegate :origin_id, :destiny_id, :value, to: :context

  def call
    context.fail!(errors: 'Invalid') if calculate_currency_value.failure?

    context.money_exchange = calculate_currency_value.money_exchange
  end

  private

  def create_query_result
    @_create_query_result ||= CreateQuery.call(origin_id: origin_id, destiny_id: destiny_id)
  end

  def calculate_currency_value
    @_calculate_currency_value ||= CalculateCurrencyValue.call(value: value, exchange_rate: create_query_result.exchange_rate)
  end
end