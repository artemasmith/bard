module GMparser
  require 'open-uri'
  @@uri = 'http://goodsmatrix.ru/goods/'
  def get_product barcode
    page = Nokogiri::HTML(open(@@uri + "#{barcode}.html", nil, 'windows-1251'))
    last_cat = update_wcategories(page.css('#ctl00_ContentPH_GroupPath_GroupName'))
    ware = Ware.new
    ware.title = page.css('#ctl00_ContentPH_GoodsName').text
    consist = page.css('#ctl00_ContentPH_Composition').text
    gost = page.css('#ctl00_ContentPH_Gost').text
    net = page.css('#ctl00_ContentPH_Net').text
    keeptime = page.css('#ctl00_ContentPH_KeepingTime').text
    content = page.css('#ctl00_ContentPH_ESL').text
    ware.specs = { consist: consist, gost: gost, net: net, keeptime: keeptime, content: content}.to_json
    ware.wcategories = last_cat


    if ware.save
      return 'ok'
    else
      return ware.errors.full_messages
    end

  end

  def update_wcategories categories

  end
end