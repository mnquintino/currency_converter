# frozen_string_literal: true

class CalculateCurrencyValue
  include Interactor

  delegate :value, :exchange_rate, to: :context

  def call
    begin
      context.money_exchange = calculate_currency
    rescue StandardError => e
      context.fail!(errors: e.message)
    end
  end

  private

  def calculate_currency
    @_calculate_currency ||= (value * valid_exchange_rate).round(2)
  end

  def valid_exchange_rate
    @_valid_exchange_rate ||= exchange_rate.nil? ? 0 : exchange_rate
  end
end
