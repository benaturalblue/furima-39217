class Address < ApplicationRecord
  belongs_to :record
  has_one :record_address
end
