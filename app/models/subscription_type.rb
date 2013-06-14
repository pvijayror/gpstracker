class SubscriptionType < ActiveRecord::Base
  attr_accessible :price, :months, :description, :translation
  class << self
    def subscription_types
      @subscription_types = SubscriptionType.all
    end
  end
end
