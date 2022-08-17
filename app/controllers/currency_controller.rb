class CurrencyController < ApplicationController
  def index
    @currencies = Currency.all
  end
end
