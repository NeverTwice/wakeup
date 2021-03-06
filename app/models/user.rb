class User < ApplicationRecord
  has_many :addresses
  enum role: [:user, :baker]
  attr_accessor :cart
  attr_accessor :price_cart
  attr_accessor :default_address

  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
