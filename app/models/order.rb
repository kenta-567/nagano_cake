class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method:{ クレジットカード: 1, 銀行振込: 2 }

  enum status:{ payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
  
  def full_address
    self.postal_code + self.address + self.name
  end
  
  
  
  
end
