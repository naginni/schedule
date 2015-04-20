class Cargo < ActiveRecord::Base
   default_scope {order('cups') }
   has_many :user_cargo_works

   validates :nombre, length: {in: 6..11}
   validates :nombre, :uniqueness => true
end
