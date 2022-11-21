class CreateQuery
  include Interactor

  delegate :origin_id, :destiny_id, to: :context

  def call
    origin = Currency.find(origin_id).initials
    destiny = Currency.find(destiny_id).initials

    context.query = origin + "_" + destiny
  rescue => e
    context.fail!(error: e.message)
  end
end