class Skill < ApplicationRecord
  serialize :properties, Hash

  def self.new_skill(arguments)
    skill = Skill.new
    skill.description = arguments[:description]
    if (skill.active = arguments[:active])
      skill.properties = { "prop1" => arguments[:prop1], "prop2" => arguments[:prop2] }
    else
      skill.properties = { "prop3" => arguments[:prop3], "prop4" => arguments[:prop4] }
    end
    skill.save
  end

  validates :active, inclusion: { in: [true, false] }
end
