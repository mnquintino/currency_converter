# frozen_string_literal: true

require '/home/mnquintino/Mentoria/currency_converter/lib/currency_api/client'

class CreateQuery
  include Interactor

  delegate :origin_id, :destiny_id, to: :context

  VALUE = 1

  def call
    binding.pry
    context.fail!(errors: 'API indisponível') unless request.success?

    context.exchange_rate = exchange_rate
  end

  private

  def exchange_rate
    request.first[VALUE]
  end

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
end
