# frozen_string_literal: true

require 'open-uri'

class CurrencyData
  URL = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

  def get_currency_details(currency = nil)
    c_detail = CurrencyDetail.find_by_rate_date(Date.today)
    if c_detail.present?
      details = c_detail.details
      currency.present? ? details.select { |c| c['currency'] == currency }.first['rate'] : details
    else
      xml_doc = open(URL)
      g_hash = Hash.from_xml(xml_doc.read)
      datas = g_hash['Envelope']['Cube']['Cube'].select { |c| c['time'] < Date.today.strftime('%F') }.first
      create_details(datas['Cube'])
      currency.present? ? datas['Cube'].select { |c| c['currency'] == currency }.first['rate'] : datas['Cube']
    end
  end

  private

  def create_details(details)
    CurrencyDetail.create(rate_date: Date.today, details: details)
  end
end
