class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :members
  has_many :groups, through: :members
  has_many :performers
  has_many :concerts, through: :performers
  has_many :oversees, class_name: 'Group'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
  	name_first + " " + name_last
  end
end
