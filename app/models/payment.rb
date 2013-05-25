class Payment < ActiveRecord::Base
  attr_accessible :subscription_id, :amount, :card_type, :last4

  belongs_to :subscription
end
