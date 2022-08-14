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
    # à décommenter quand les ligne 18-21 de persos_controller seront déplacées
    inventory = Inventory.new
    inventory.perso = Perso.find(arguments[:perso_id])
    inventory.item = item
    return item if inventory.save
  end

  validates :consumable, inclusion: { in: [true, false] }
end
