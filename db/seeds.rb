# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#CATEGORIES
[
    { title: 'Продукты питания', alt_title: 'Foodsstuffs' },
    { title: 'Алкогольные напитки', alt_title: 'Alchogolic-drinks'  },
    { title: 'Бытовая химия', alt_title: 'Household-goods'  },
    { title: 'Детские товары', alt_title: 'Goods-for-children'  },
    { title: 'Зоотовары', alt_title: 'Goods-for-pets'  },
    { title: 'Косметика, парфюмерия', alt_title: 'Perfume-and-toiletries'  },
    { title: 'Медицинские товары', alt_title: 'Medical-goods'  },
    { title: 'Табачные изделия', alt_title: 'Tobacco-products'  },
    { title: 'Товары для дома', alt_title: 'Homeware'  }
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

#User.create(email: 'artemasmith@gmail.com', password: '12345678', role: :admin)

#User.find_or_create_by(email: 'nikita@ples.ru', password: '12345678', role: :admin, login: 'nikita')
#nik = User.findby_email('nikita@ples.ru')
#nik.activities.create(amount_debet: 100000)
#User.find_or_create_by( email: 'artemasmith@gmail.com', password: '12345678', role: :admin, login: 'art')
#art = User.find_by_email('artemasmith@gmail.com')
#art.activities.create(amount_debet: 100000)

#PARENTS
w0 = Wcategory.find_or_create_by ({ title: 'Товары' })
w1 = Wcategory.find_or_create_by ({title: 'Продукты питания', parent_id: w0.id})
w2 = Wcategory.find_or_create_by ({ title: 'Алкогольные напитки', parent_id: w0.id})
w3 = Wcategory.find_or_create_by ({ title: 'Продукты питания', parent_id: w0.id})
w4 = Wcategory.find_or_create_by ({ title: 'Бытовая химия', parent_id: w0.id})
w5 = Wcategory.find_or_create_by ({ title: 'Детские товары', parent_id: w0.id})
w6 = Wcategory.find_or_create_by ({ title: 'Зоотовары', parent_id: w0.id})
w7 = Wcategory.find_or_create_by ({ title: 'Косметика, парфюмерия', parent_id: w0.id})
w8 = Wcategory.find_or_create_by ({ title: 'Медицинские товары', parent_id: w0.id})
w9 = Wcategory.find_or_create_by ({ title: 'Табачные изделия', parent_id: w0.id})
w10 = Wcategory.find_or_create_by ({ title: 'Строительные товары', parent_id: w0.id})
w11 = Wcategory.find_or_create_by ({ title: 'Товары для дачи', parent_id: w0.id})
w12 = Wcategory.find_or_create_by ({ title: 'Товары для дома', parent_id: w0.id})

#Level 1 children
w21  = Wcategory.find_or_create_by({ title: 'Бакалея', parent_id: w1.id })
w22  = Wcategory.find_or_create_by({ title: 'Гастрономия', parent_id: w1.id })
w23  = Wcategory.find_or_create_by({ title: 'Детское питание', parent_id: w1.id })
w24  = Wcategory.find_or_create_by({ title: 'Диетическое питание', parent_id: w1.id })
w25  = Wcategory.find_or_create_by({ title: 'Замороженные продукты', parent_id: w1.id })
w26  = Wcategory.find_or_create_by({ title: 'Кондитерские изделия', parent_id: w1.id })
w27  = Wcategory.find_or_create_by({ title: 'Кулинария', parent_id: w1.id })
w28 = Wcategory.find_or_create_by({ title: 'Молочные продукты', parent_id: w1.id })
w29 = Wcategory.find_or_create_by({ title: 'Мясо, птица, яйцо', parent_id: w1.id })
w211 = Wcategory.find_or_create_by({ title: 'Напитки безалкогольные', parent_id: w1.id })
w221 = Wcategory.find_or_create_by({ title: 'Рыба, морепродукты', parent_id: w1.id })
w222 = Wcategory.find_or_create_by({ title: 'Спортивное питание', parent_id: w1.id })
w223 = Wcategory.find_or_create_by({ title: 'Фрукты, овощи, грибы', parent_id: w1.id })
w224 = Wcategory.find_or_create_by({ title: 'Хлебобулочные изделия', parent_id: w1.id })
w225 = Wcategory.find_or_create_by({ title: 'Чай, кофе, какао', parent_id: w1.id })

#Level 2 children
# Бакалея
w31  = Wcategory.find_or_create_by({ title: 'Горчица, хрен, аджика', parent_id: w21.id })
w32  = Wcategory.find_or_create_by({ title: 'Грибы сушеные', parent_id: w21.id })
w33  = Wcategory.find_or_create_by({ title: 'Жевательная резинка', parent_id: w21.id })
w34  = Wcategory.find_or_create_by({ title: 'Кетчупы, соусы', parent_id: w21.id })
w35  = Wcategory.find_or_create_by({ title: 'Кондитерские украшения', parent_id: w21.id })
w36  = Wcategory.find_or_create_by({ title: 'Крупы', parent_id: w21.id })
w37  = Wcategory.find_or_create_by({ title: 'Макаронные изделия', parent_id: w21.id })
w38  = Wcategory.find_or_create_by({ title: 'Масло растительное', parent_id: w21.id })
w39  = Wcategory.find_or_create_by({ title: 'Мёд и продукты пчеловодства', parent_id: w21.id })
w310  = Wcategory.find_or_create_by({ title: 'Мука и мучные смеси', parent_id: w21.id })
w311 = Wcategory.find_or_create_by({ title: 'Набор для суши', parent_id: w21.id })
w312  = Wcategory.find_or_create_by({ title: 'Напитки растворимые', parent_id: w21.id })
w313  = Wcategory.find_or_create_by({ title: 'Овощи сушеные', parent_id: w21.id })
w314  = Wcategory.find_or_create_by({ title: 'Орехи и сухофрукты', parent_id: w21.id })
w315  = Wcategory.find_or_create_by({ title: 'Продукты быстрого приготовления', parent_id: w21.id })
w316  = Wcategory.find_or_create_by({ title: 'Пряности, приправы', parent_id: w21.id })
w317  = Wcategory.find_or_create_by({ title: 'Смеси сухие для приготовления блюд', parent_id: w21.id })
w318  = Wcategory.find_or_create_by({ title: 'Снеки', parent_id: w21.id })
w319  = Wcategory.find_or_create_by({ title: 'Соль, сахар, сода', parent_id: w21.id })
w320  = Wcategory.find_or_create_by({ title: 'Специи', parent_id: w21.id })
w321  = Wcategory.find_or_create_by({ title: 'Сухие завтраки', parent_id: w21.id })

#ГАстрономия
w301  = Wcategory.find_or_create_by({ title: 'Майонез', parent_id: w22.id })
w302  = Wcategory.find_or_create_by({ title: 'Маргарин, спред, жиры кулинарные', parent_id: w22.id })
w303  = Wcategory.find_or_create_by({ title: 'Масло сливочное', parent_id: w22.id })
w304  = Wcategory.find_or_create_by({ title: 'Масло топленое', parent_id: w22.id })
w305  = Wcategory.find_or_create_by({ title: 'Мясная гастрономия', parent_id: w22.id })
w306  = Wcategory.find_or_create_by({ title: 'Рыбная гастрономия', parent_id: w22.id })
w307  = Wcategory.find_or_create_by({ title: 'Сырный продукт', parent_id: w22.id })
w308  = Wcategory.find_or_create_by({ title: 'Сыры', parent_id: w22.id })

#ДЕтское питание
w311  = Wcategory.find_or_create_by({ title: 'Детские смеси', parent_id: w23.id })
w312  = Wcategory.find_or_create_by({ title: 'Детское питание другое', parent_id: w23.id })
w313  = Wcategory.find_or_create_by({ title: 'Драже с игрушкой', parent_id: w23.id })
w314  = Wcategory.find_or_create_by({ title: 'Каши для детского питания', parent_id: w23.id })
w315  = Wcategory.find_or_create_by({ title: 'Крекер детский', parent_id: w23.id })
w316  = Wcategory.find_or_create_by({ title: 'Молочные продукты для детского питания', parent_id: w23.id })
w317  = Wcategory.find_or_create_by({ title: 'Напитки детские', parent_id: w23.id })
w318  = Wcategory.find_or_create_by({ title: 'Печенье детское', parent_id: w23.id })
w319  = Wcategory.find_or_create_by({ title: 'Пюре для детского питания', parent_id: w23.id })

#Диетическое питание

w321  = Wcategory.find_or_create_by({ title: 'Диетические продукты другие', parent_id: w24.id })
w322  = Wcategory.find_or_create_by({ title: 'Заменители сахара', parent_id: w24.id })
w323  = Wcategory.find_or_create_by({ title: 'Зерно для проращивания', parent_id: w24.id })
w324  = Wcategory.find_or_create_by({ title: 'Каша льняная', parent_id: w24.id })
w325  = Wcategory.find_or_create_by({ title: 'Клетчатка', parent_id: w24.id })
w326  = Wcategory.find_or_create_by({ title: 'Кондитерские изделия диабетические', parent_id: w24.id })
w327  = Wcategory.find_or_create_by({ title: 'Кофе для похудения', parent_id: w24.id })
w328  = Wcategory.find_or_create_by({ title: 'Напитки диетические газированные', parent_id: w24.id })
w329  = Wcategory.find_or_create_by({ title: 'Отруби', parent_id: w24.id })
w3210  = Wcategory.find_or_create_by({ title: 'Соевые продукты', parent_id: w24.id })
w3211  = Wcategory.find_or_create_by({ title: 'Соль диетическая', parent_id: w24.id })
w3212  = Wcategory.find_or_create_by({ title: 'Толокно', parent_id: w24.id })
w3213  = Wcategory.find_or_create_by({ title: 'Хлебобулочные изделия диетические', parent_id: w24.id })

#Замороженные продукты
w3231  = Wcategory.find_or_create_by({ title: 'Готовые блюда замороженные', parent_id: w25.id })
w = w3231.children.find_or_create_by({title: 'Готовые блюда мясные замороженные'})
w.children.find_or_create_by({title: 'Азу готовое замороженное'})
w.children.find_or_create_by({title: 'Готовые блюда мясные замороженные другие'})
w.children.find_or_create_by({title: 'Гуляш готовый замороженный'})
w.children.find_or_create_by({title: 'Жаркое готовое замороженное'})
w.children.find_or_create_by({title: 'Котлеты с гарниром готовые замороженные'})
w.children.find_or_create_by({title: 'Плов готовый замороженный'})
w321.children.find_or_create_by({title: 'Готовые блюда овощные замороженные'})
w321.children.find_or_create_by({title: 'Готовые блюда рыбные замороженные'})
w321.children.find_or_create_by({title: 'Улитки съедобные готовые замороженные'})
w3232  = Wcategory.find_or_create_by({ title: 'Овощи, фрукты, грибы замороженые', parent_id: w25.id })
w3233  = Wcategory.find_or_create_by({ title: 'Полуфабрикаты замороженные', parent_id: w25.id })
w3234  = Wcategory.find_or_create_by({ title: 'Травы замороженные', parent_id: w25.id })
