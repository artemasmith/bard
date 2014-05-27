class Api::V1::BarcodesController < ApplicationController

  before_action :authenticate_client

  def index

  end

  def show
    xml = Nokogiri::XML ''
    body = Nokogiri::XML::Node.new 'body', xml
    barcodes = Nokogiri::XML::Node.new 'barcodes', xml
    # groups = Nokogiri::XML::Node.new 'groups', xml
    characteristics = Nokogiri::XML::Node.new 'characteristics', xml
    categories = Nokogiri::XML::Node.new 'categories', xml
    properties = Nokogiri::XML::Node.new 'properties', xml
    values = Nokogiri::XML::Node.new 'values', xml
    wares = Nokogiri::XML::Node.new 'wares', xml
    errors = Nokogiri::XML::Node.new 'errors', xml

    numbers = params[:number].split(',')
    numbers.each do |n|
      b = Barcode.find_by_number(n)
      if b
        barcode = Nokogiri::XML::Node.new 'barcode', xml
        barcode[:number] = b.number
        barcode[:id_ware] = b.ware_id
        barcode[:id_char] = b.ware.characteristics.last.id if !b.ware.characteristics.blank?
        barcodes.add_child(barcode)

        #characteristics
        b.ware.characteristics.each do |chr|
          character = Nokogiri::XML::Node.new 'characteristic', xml
          character[:id_ware] = chr.ware_id
          character[:id_prop] = chr.property_id
          character[:id_val] = chr.value_id
          character[:id_ext] = chr.id_ext
          characteristics.add_child(character)

          value = Nokogiri::XML::Node.new 'value', xml
          value[:val] = chr.value.content
          value[:id_ext] = chr.value.id_ext
          values.add_child(value)

          property = Nokogiri::XML::Node.new 'property', xml
          property[:title] = chr.property.title
          property[:id_ext] = chr.property.id_ext
          properties.add_child(property)

          category = Nokogiri::XML::Node.new 'category', xml
          category[:title] = b.ware.category.title
          category[:id_ext] = b.ware.category.id_ext
          categories.add_child(category)

        end

      else
        #@client.unvalidated_wares.create()
        barcode = Nokogiri::XML::Node.new 'error', xml
        barcode.content = "Can't find barcode with given number"
        errors.add_child(barcode)
      end

    end
    xml.add_child(body)
    xml.children.first.add_child(barcodes)
    # xml.children.first.add_child(groups)
    xml.children.first.add_child(characteristics)
    xml.children.first.add_child(categories)
    xml.children.first.add_child(properties)
    xml.children.first.add_child(values)
    xml.children.first.add_child(wares)
    xml.children.first.add_child(errors)

    if errors.children.blank?
      render xml: xml, status: 200
    else
      render xml: xml, status: 400
    end
  end

  def create

  end

  protected

  def authenticate_client
    @client = Client.find_by_login(params[:login])
    @shop = @client.shops.where(auth_token: params[:auth_token])[0]
  end
end