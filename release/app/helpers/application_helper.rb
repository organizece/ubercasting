module ApplicationHelper

  def states
    states = []
    states << ['', '']
    STATES.each { |state|
        states << [t(state, scope: :states), state]
    }
    
    states
  end

end
