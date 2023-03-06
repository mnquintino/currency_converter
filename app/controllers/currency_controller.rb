# frozen_string_literal: true

class CurrencyController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def create
    @currency = GetCurrencyValue.call(currency_params)
  end

  def show
    flash[:notice] = "Passou por aqui!"
  end

  private

  def currency_params
    params.require(:currency).permit(:value, :origin_id, :destiny_id)
  end
end
