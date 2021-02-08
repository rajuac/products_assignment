# frozen_string_literal: true

class Product < ActiveRecord::Base
  require 'currency_data'

  def price
    price_in_cents / 100.0
  end

  def get_price(currency)
    c_price = show_price(currency)
    (price * c_price.to_f).round
  end

  def show_price(currency)
    c_data = CurrencyData.new
    c_data.get_currency_details(currency)
  end
end
