class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :house_number, :building, :phone_number, :record_id
  
  with_options presence: true do
    validates :city, :house_number
    validates :user_id, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
  end
    validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building: building, phone_number: phone_number, record_id: record.id)
  end
  
  attr_accessor :token
  validates :token, presence: true
  
  
end