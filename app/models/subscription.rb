class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :start_date, :end_date
end
