class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :start_date, :end_date
  has_one :payment

  def active?
    end_date > Time.now.to_date
  end
end
