class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks


  validates :password, presence: true

  after_create :welcome_send


  private
  def welcome_send
  	WelcomeMailer.welcome_send(self).deliver
  end
end
