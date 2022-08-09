class Enemy
  def self.generate_enemy(arguments)
    enemy = Enemy.new
    perso_lvl = arguments[:perso_lvl]
    enemy.type = arguments[:type]
    enemy.name = arguments[:name]
    enemy.lvl = 0 if (enemy.lvl = rand((perso_lvl - 3)..perso_lvl + 3)).negative?

    case enemy.lvl
    when enemy.lvl < perso_lvl - 1
      enemy.difficulty = "easy"
      enemy.enemy_stats = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
      enemy.enemy_gear = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
      enemy.enemy_skill = []
    when enemy.lvl > perso_lvl + 1
      enemy.difficulty = "hard"
      enemy.enemy_stats = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
      enemy.enemy_gear = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
      enemy.enemy_skill = []
    else
      enemy.difficulty = "normal"
      enemy.enemy_stats = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
      enemy.enemy_gear = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
      enemy.enemy_skill = []
    end
    enemy.save
  end
end
