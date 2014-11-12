require 'mechanize'


class Parser
FoodURL = 'http://www.goodsmatrix.ru/goods-catalogue/Goods/Foodstuffs.html'

  def initialize
    @agent = Mechanize.new
    page = @agent.get(FoodURL)
    @catalog = page.search("table#ctl00_ContentPH_ChildDL").search('a').map{ |c| { name: c.text, href: c['href'], children: [] } }
  end

  def self.has_children node
    node.search("table#ctl00_ContentPH_ChildDL").search('a').present?
  end

  def make_full_catalog
    @catalog.each do |category|
      page = @agent.get(categor['href'])
      while Parser.has_children page do

      end
    end
  end

  def get_children node, page
    #if Parser.has_children page
      node['children'] = page.search("table#ctl00_ContentPH_ChildDL").search('a').map{ |c| { name: c.text, href: c['href'], children: [] } }
    #end
  end

  #recursive grabering of categories
  def get_catalog url, categories
    url ||= self.FoodURL
    page = @agent.get(url)
    #while there is table#ctl00_ContentPH_ChildDL links - we grabber children

  end

  def get_products category_path
    page = @agent.get(category_path)
    table = page.search("table.Grd")
    pagination_links = table.search("td[colspan~='5']").search('a')

  end

  def insert_to_db products

  end

end
namespace :parsing do

  desc "Parsing tool for grabbing wares info from goodsmatrix.ru"

  task get_new: :environment do

  end
end
