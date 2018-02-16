class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  before_destroy :check_for_cocktail

  private

  def check_for_cocktail
    unless doses.nil?
      self.errors[:base] << "Cannot delete ingredient while it has cocktails."
      return false
    end
  end
end
