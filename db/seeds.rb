# frozen_string_literal: true

Rails.logger.debug '==================== product create ===================='

product1 = Product.new(
  name: '黄色シューズ',
  description: 'ランニングシューズメンズ スポーツシューズ メッシュ 軽量 通気性',
  price: 10_000,
  stock: 30
)
product1.image.attach(io: File.open(Rails.root.join('app/assets/images/EC1.jpg')), filename: 'EC1.jpg')
product1.save!

product2 = Product.new(
  name: '赤シューズ',
  description: 'ランニングシューズメンズ スポーツシューズ メッシュ 赤色',
  price: 7500,
  stock: 20
)

product2.image.attach(io: File.open(Rails.root.join('./app/assets/images/EC2.jpg')), filename: 'EC2.jpg')
product2.save!

product3 = Product.new(
  name: 'ピンクシューズ',
  description: 'ランニングシューズメンズ スポーツシューズ メッシュ ピンク色',
  price: 5500,
  stock: 10
)

product3.image.attach(io: File.open(Rails.root.join('./app/assets/images/EC3.jpg')), filename: 'EC3.jpg')
product3.save!

product4 = Product.new(
  name: '青色シューズ',
  description: 'ランニングシューズメンズ スポーツシューズ メッシュ 青色色',
  price: 500,
  stock: 10
)

product4.image.attach(io: File.open(Rails.root.join('./app/assets/images/EC4.jpg')), filename: 'EC4.jpg')
product4.save!
