class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true #修正
  validates :email, presence: true #修正
  validates :encrypted_password, presence: true #修正
  validates :profile, presence: true #修正
  validates :occupation, presence: true #修正
  validates :position, presence: true #修正

end
