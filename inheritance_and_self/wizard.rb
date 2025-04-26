require_relative 'character'

class Wizard < Character
  attr_writer :warrior

  def can_cast_spell?
    true
  end

  def self.spells
    ["Fireball", "Lightning Bolt", "Magic Missile"]
  end

  def self.spell_details(spell)
    case spell
    when 'Fireball' then 'Burn the enemy to the death'
    when 'Lightning Bolt' then 'Electrocute them'
    when 'Magic Missile' then 'Bomb them like hell'
    else
      raise StandardError, "Wizards cannot spell #{spell}"
    end
  end

  def this_is_self
    puts "This is what self is"
    self
  end
end

