# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#CATEGORIES
[
    { title: 'макаронные изделия' },
    { title: 'крупы' },
    { title: 'специи' },
    { title: 'молочная продукция' },
    { title: 'колбасные изделия' },
    { title: 'мясо' },
    { title: 'рыба' }
].each do |category|
  Category.find_or_create_by(category)
end

#PROPERIES
[
    { title: 'жирность' },
    { title: 'цвет' },
    { title: 'срок хранения' },
    { title: 'крутость' }
].each do |property|
  Property.find_or_create_by(property)
end

#VALUES
[
    { property_id: 1, content: '30%' },
    { property_id: 1, content: '20%' },
    { property_id: 1, content: '40%' },
    { property_id: 2, content: 'белый' },
    { property_id: 2, content: 'черный' }
].each do |value|
  Value.find_or_create_by(value)
end

#WARES
[
    { title: 'Молоко', specs: 'Йоу Буренка, тру молоко', category_id: 4 },
    { title: 'Сметана', specs: 'Йоу Буренка, тру сметана', category_id: 4 },
    { title: 'Паста Рогаци', specs: 'Снупдог паста', category_id: 1 },
    { title: 'Рожки', specs: 'советюнионстайл', category_id: 1 },
    { title: 'Греча', specs: 'Богатая реча', category_id: 2 },
    { title: 'Рис', specs: 'Не смотри вниз', category_id: 2 },
].each do |ware|
  Ware.find_or_create_by(ware)
end

#CHARACTERISTICS
[
    { property_id: 1, ware_id: 1, value_id: 1},
    { property_id: 2, ware_id: 2, value_id: 5},
    { property_id: 2, ware_id: 2, value_id: 4},
    { property_id: 3, ware_id: 1, value_id: 3},
    { property_id: 1, ware_id: 3, value_id: 1},
    { property_id: 2, ware_id: 3, value_id: 2},
    { property_id: 3, ware_id: 3, value_id: 3}
].each do |char|
  Characteristic.find_or_create_by(char)
end

#BARCODES

[
    { number: '123312', ware_id: 1 },
    { number: '231132', ware_id: 2 },
    { number: '435434', ware_id: 3 },
    { number: '34546098798', ware_id: 4 },
    { number: '12309821308', ware_id: 5 },
    { number: '23434234234', ware_id: 5 }
].each do |barcode|
  Barcode.find_or_create_by(barcode)
end

#TARIFFS

[
    { title: 'Free', cost: 0.0, shops_count: 0, categories_count: 0 },
    { title: 'Little', cost: 100.0, shops_count: 1, categories_count: 10 },
    { title: 'Middle', cost: 1000.0, shops_count: 10, categories_count: 20 },
    { title: 'Large', cost: 1000.0, shops_count: 100, categories_count: 60 }
].each do |tariff|
  Tariff.find_or_create_by tariff
end

User.create(email: 'artemasmith@gmail.com', password: '12345678', role: :admin)