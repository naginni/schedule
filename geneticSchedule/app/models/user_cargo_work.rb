class UserCargoWork < ActiveRecord::Base
   belongs_to :user
   belongs_to :cargo

   validates :estado, length: {:maximum => 1}
   validates :estado, numericality: {only_integer: true}
   validates :monday, length: {:maximum => 1}
   validates :tuesday, length: {:maximum => 1}
   validates :wednesday, length: {:maximum => 1}
   validates :thursday, length: {:maximum => 1}
   validates :friday, length: {:maximum => 1}
end
