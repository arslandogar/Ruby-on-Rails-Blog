class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
