class Item < ApplicationRecord
  serialize :properties, Hash

  def self.new_item(arguments)
    item = Item.new
    if (item.consumable = arguments[:consumable])
      item.properties = { "stat" => arguments[:stat], "amount" => arguments[:amount] }
    else
      item.properties = { "slot" => arguments[:slot], "type" => arguments[:type],
          "dmg" => arguments[:dmg], "armor" => arguments[:armor], "str" => arguments[:str],
          "dex" => arguments[:dex], "vit" => arguments[:vit],
          "int" => arguments[:int], "wis" => arguments[:wis] }
    end
    item.save
  end

  validates :consumable, presence: true
end
