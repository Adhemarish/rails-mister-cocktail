class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true, uniqueness: { scope: [:ingredient_id, :cocktail_id] }
end
