class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item

enum making_status:{
    payment_waiting: 0,
    payment_confirmation: 1,
    in_production: 2,
    preparing_delivery: 3
  }
end
