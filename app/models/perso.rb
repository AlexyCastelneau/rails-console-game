class Perso < ApplicationRecord
  belongs_to :user
  serialize :base_stats, Hash
  serialize :gear, Hash
  serialize :geared_stats, Hash
  serialize :current_stats, Hash

  def set_base_stats#(arguments) à ajuster quand il y aura les races
    self.base_stats = { "str" => 10, "dex" => 10, "vit" => 10, "int" => 10, "wis" => 10 }
  end

  def set_gear#(arguments) à ajuster quand il y aura les classes
    # def generate_item(arguments) ?
    head = Item.new_item({consumable: false, slot: "head", type: "light", dmg: 0, armor: 1, str: 0, dex: 0, vit: 0, int: 0, wis: 0, perso_id: self.id })
    body = Item.new_item({consumable: false, slot: "body", type: "light", dmg: 0, armor: 1, str: 0, dex: 0, vit: 0, int: 0, wis: 0, perso_id: self.id })
    hands = Item.new_item({consumable: false, slot: "hands", type: "light", dmg: 0, armor: 1, str: 0, dex: 0, vit: 0, int: 0, wis: 0, perso_id: self.id })
    legs = Item.new_item({consumable: false, slot: "legs", type: "light", dmg: 0, armor: 1, str: 0, dex: 0, vit: 0, int: 0, wis: 0, perso_id: self.id })
    feet = Item.new_item({consumable: false, slot: "feet", type: "light", dmg: 0, armor: 1, str: 0, dex: 0, vit: 0, int: 0, wis: 0, perso_id: self.id })
    primary_weapon = Item.new_item({consumable: false, slot: "primary_weapon", type: "1H_sword", dmg: 5, armor: 0, str: 0, dex: 0, vit: 0, int: 0, wis: 0, perso_id: self.id })
    secondary_weapon = nil
    self.gear = { "head" => head, "body" => body, "hands" => hands, "legs" => legs, "feet" => feet,
        "primary_weapon" => primary_weapon, "secondary_weapon" => secondary_weapon }
  end

  def set_geared_stats
    base = self.base_stats
    gear = self.gear
    keys = gear.keys
    geared = { "armor" => 0, "str" => base["str"], "dex" => base["dex"], "vit" => base["vit"], "int" => base["int"], "wis" => base["wis"] }
    stats = geared.keys
    keys.each { |slot| (stats.each { |stat| geared[stat] += gear[slot].properties[stat] }) if !gear[slot].nil? }
    self.geared_stats = geared
  end

  def set_current_stats
    geared = self.geared_stats
    max_hp = geared["str"] + 10 * geared["vit"]
    max_mp = self.lvl + 5 * geared["int"]
    self.current_stats = { "current_hp" => max_hp, "max_hp" => max_hp, "current_mp" => max_mp, "max_mp" => max_hp,
        "dmg_buff" => 0, "armor" => geared["armor"], "str" => geared["str"], "dex" => geared["dex"],
        "vit" => geared["vit"], "int" => geared["int"], "wis" => geared["wis"] }
  end

  def time_conversion(time)
    time = time.to_i
    seconds = time % 60
    time = time - seconds
    minutes = (time / 60) % 60
    time = (time / 60) - minutes
    hours = time / 60
    return "#{hours}h#{minutes}m#{seconds}s"
  end

  validates :pseudo, presence: true, length: { maximum: 12 }
end
