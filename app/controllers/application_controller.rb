class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_currencies
    c_data = CurrencyData.new
    @cash = c_data.get_currency_details
  end
end
