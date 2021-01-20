class Gender < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '女の子' },
   { id: 3, name: '男の子' },
 ]
 include ActiveHash::Associations
 has_many :rooms
end
