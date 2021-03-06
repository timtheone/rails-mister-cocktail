class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail, :ingredient, uniqueness: {
    scope: [:cocktail, :ingredient] }
end
