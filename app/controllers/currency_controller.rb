# frozen_string_literal: true

class CurrencyController < ApplicationController
  def index
    @currencies = Currency.all
    render json: @currencies
  end
end
