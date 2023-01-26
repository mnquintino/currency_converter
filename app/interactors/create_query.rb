# frozen_string_literal: true

require '/Users/renatamarques/currency_converter/lib/currency_api/client.rb'

class CreateQuery
  include Interactor

  delegate :origin_id, :destiny_id, to: :context

  VALUE = 1

  def call
    context.fail!(errors: 'API indisponível') unless request.success?

    context.exchange_rate = exchange_rate
  end

  private

  def query
    begin
      origin = Currency.find(origin_id).initials
      destiny = Currency.find(destiny_id).initials
    rescue ActiveRecord::RecordNotFound
      context.fail!(errors: 'ID não encontrado')
    end
    @query ||= "#{origin}_#{destiny}"
  end

  def request
    @request ||= CurrencyApi::Client.new.request(query)
  end

  def exchange_rate
    request.first[VALUE]
  end
end
