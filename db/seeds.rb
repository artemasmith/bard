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
  Category.create(category)
end

#PROPERIES
[
    { title: 'жирность' },
    { title: 'цвет' },
    { title: 'срок хранения' },
    { title: 'крутость' }
].each do |property|
  Property.create(property)
end

#VALUES
[
    { id_prop: 1, value: '30%' },
    { id_prop: 1, value: '20%' },
    { id_prop: 1, value: '40%' },
    { id_prop: 2, value: 'белый' },
    { id_prop: 2, value: 'черный' }
].each do |value|
  Value.create(value)
end

#WARES
[
    { title: 'Молоко', specs: 'Йоу Буренка, тру молоко', id_cat: 4 },
    { title: 'Сметана', specs: 'Йоу Буренка, тру сметана', id_cat: 4 },
    { title: 'Паста Рогаци', specs: 'Снупдог паста', id_cat: 1 },
    { title: 'Рожки', specs: 'советюнионстайл', id_cat: 1 },
    { title: 'Греча', specs: 'Богатая реча', id_cat: 2 },
    { title: 'Рис', specs: 'Не смотри вниз', id_cat: 2 },
].each do |ware|
  Ware.create(ware)
end

#CHARACTERISTICS
[
    { id_prop: 1, id_ware: 1, id_val: 1},
    { id_prop: 2, id_ware: 2, id_val: 5},
    { id_prop: 2, id_ware: 2, id_val: 4},
    { id_prop: 3, id_ware: 1, id_val: 3},
    { id_prop: 1, id_ware: 3, id_val: 1},
    { id_prop: 2, id_ware: 3, id_val: 2},
    { id_prop: 3, id_ware: 3, id_val: 3}
].each do |char|
  Characteristic.create(char)
end

#BARCODES

[
    { number: '123312', id_ware: 1 },
    { number: '231132', id_ware: 2 },
    { number: '435434', id_ware: 3 },
    { number: '34546098798', id_ware: 4 },
    { number: '12309821308', id_ware: 5 },
    { number: '23434234234', id_ware: 5 }
].each do |barcode|
  Barcode.create(barcode)
end