class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :shipping_time
  has_one_attached :image

  validates :title, :content, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, numericality: { only_integer: true }

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :shipping_time_id, numericality: { other_than: 1 }
end
