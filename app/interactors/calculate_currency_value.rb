# frozen_string_literal: true

class CalculateCurrencyValue
  include Interactor

  delegate :origin_id, :destiny_id, :value, to: :context

  def call
    context.money_exchange = calculate_currency
  rescue StandardError => e
    context.fail!(errors: e.message)
  end

  private

  def calculate_currency
    exchange_rate = fail_on_failure! { CreateQuery.call(origin_id: origin_id, destiny_id: destiny_id) }.exchange_rate
    @calculate_currency ||= (value * exchange_rate).round(2)
  end

  def fail_on_failure!
    interactor = yield

    context.fail!(errors: interactor.errors) if interactor.failure?

    interactor
  end
end
