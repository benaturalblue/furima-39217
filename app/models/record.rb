class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :address
  has_one :record_address
end
