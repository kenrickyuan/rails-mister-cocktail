class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  # (not needed?, linked already?)
  validates :name, presence: true, uniqueness: true
end
