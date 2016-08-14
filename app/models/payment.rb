class Payment < ActiveRecord::Base
  belongs_to :status_payment
  belongs_to :kind_payment
end
