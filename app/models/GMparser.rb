class GMparser

  require 'open-uri'


  def get_page url
    @page = Nokogiri::HTML(open(url))

  end

  def get_product barcode

  end
end