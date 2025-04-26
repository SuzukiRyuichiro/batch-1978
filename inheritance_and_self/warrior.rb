require_relative 'character'

class Warrior < Character
  def can_cast_spell?
    false
  end

  def total_power
    # Run the method as is in the parent
    # Then do something else on top
    super * 2.0
  end

  def join_forces(wizard) # Take an instance of Wizard as an argument
    @wizard = wizard
    # the wizard to have the warrior as an instance variable
    @wizard.warrior = self
  end
end
