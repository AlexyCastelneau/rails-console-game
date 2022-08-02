class EnemySkill < ApplicationRecord
  belongs_to :enemy
  belongs_to :skill
end
