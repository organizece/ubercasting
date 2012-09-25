module ApplicationHelper

  def states
    states = []
    states << ['', '']
    STATES.each { |state|
        states << [I18n.t(state, scope: :states), state]
    }
    
    states
  end

end
