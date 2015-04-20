class User < ActiveRecord::Base
   default_scope {order('cc') }
   has_many :user_cargo_works
#   attr_accessible :email, :password, :password_confirmation
  
   attr_accessor :password
   before_save :encrypt_password

   validates_confirmation_of :password
   validates_presence_of :password, :on => :create
   validates_presence_of :email
   validates_uniqueness_of :email
   validates :cc, length: {in: 6..11}
   validates :cc, numericality: {only_integer: true}
   validates :nombre, length: {maximum: 30}  
   validates :apellido, length: {maximum: 30}  
   validates :perfil, length: {maximum: 30}  
   validates :telefono, length: {maximum: 11}  
   validates :telefono, numericality: {only_integer: true}
   validates :direccion, length: {maximum: 30}  
   validates :especialidad, length: {maximum: 60}  

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
