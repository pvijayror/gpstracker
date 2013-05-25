class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_name, :first_name, :last_name, :telephone, :cellphone  
  # attr_accessible :title, :body

  has_many :devices
  has_many :subscriptions

  def has_active_subscription?
    unless subscriptions.blank?
      subscriptions.last.end_date > Time.now.to_date
    else
      false
    end
  end
end
