class Event < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '出産' },
    { id: 3, name: '誕生日' },
    { id: 4, name: 'お七夜' },
    { id: 5, name: 'お宮参り' },
    { id: 6, name: 'お食い初め' },
    { id: 7, name: '初正月' },
    { id: 8, name: '初節分' },
    { id: 9, name: '桃の節句' },
    { id: 10, name: '端午の節句' },
    { id: 11, name: 'ハーフバースデー' },
    { id: 12, name: 'その他' }
  ]
include ActiveHash::Associations
has_many :posts
end
