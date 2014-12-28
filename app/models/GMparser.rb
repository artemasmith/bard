class GMparser
  require 'open-uri'
  @@uri = 'http://goodsmatrix.ru/goods/'
  def self.get_product barcode
    page = Nokogiri::HTML(open(@@uri + "#{barcode}.html"), nil, 'windows-1251')
    last_cat = update_wcategories(page.css('#ctl00_ContentPH_GroupPath_GroupName').text)
    title = page.css('#ctl00_ContentPH_GoodsName').text.gsub(/"/, '|').mb_chars.upcase.to_s
    if Ware.find_by_title(title).blank?
      ware = Ware.new
      ware.title = title
      consist = page.css('#ctl00_ContentPH_Composition').text
      gost = page.css('#ctl00_ContentPH_Gost').text
      net = page.css('#ctl00_ContentPH_Net').text
      keeptime = page.css('#ctl00_ContentPH_KeepingTime').text
      content = page.css('#ctl00_ContentPH_ESL').text
      ware.specs = { consist: consist, gost: gost, net: net, keeptime: keeptime, content: content}.to_json

      if ware.save
        ware.wcategories << last_cat
        return 'ok'
      else
        return ware.errors.full_messages
      end
    else
      return 'ware already exists'
    end
  end

  def self.update_wcategories categories
    categories = categories.split('/')
    last_parent = Wcategory.find_by_title(categories[0].strip)
    puts "last parent #{last_parent}"
    categories.each do |cat|
      wcat = Wcategory.find_by_title(cat.strip)
      puts "wcat #{wcat}"
      if wcat.present?
        last_parent = wcat
        next
      else
        last_parent.children.create(title: cat.strip)
      end
    end
    Wcategory.find_by_title(categories.last.strip)
  end
end