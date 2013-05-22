class Payment < ActiveRecord::Base
  attr_accessible :subscription_id, :amount
end
