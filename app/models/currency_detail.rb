# frozen_string_literal: true

class CurrencyDetail < ApplicationRecord
  serialize :details, Array
end
