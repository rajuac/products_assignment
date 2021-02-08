
 require 'open-uri'

class CurrencyData
  URL = 'https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

  def get_currency_details(currency=nil)
    xml_doc = open(URL)
    g_hash = Hash.from_xml(xml_doc.read)
    datas = g_hash["Envelope"]["Cube"]["Cube"].select{|c| c["time"] < Date.today.strftime("%F")}.first
    currency.present? ? datas["Cube"].select{|c| c["currency"] == currency}.first["rate"] : datas["Cube"]
  end

end