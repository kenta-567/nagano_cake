# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'test@test.com',
   password: '000000'
)

Customer.create!(
   last_name: '現実',
   first_name: '理想',
   last_name_kana: 'ゲンジツ',
   first_name_kana: 'コレガ',
   email: 'ooo@ooo.com',
   encrypted_password: '111111',
   postal_code: '5551111',
   address: '東京都渋⾕区神南１丁⽬１９−１１ パークウェースクエア24階',
   telephone_number: '0368696935',
   is_active: 'true'
   )