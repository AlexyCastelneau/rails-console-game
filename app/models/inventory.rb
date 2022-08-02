class Inventory < ApplicationRecord
  belongs_to :perso
  belongs_to :item
end
