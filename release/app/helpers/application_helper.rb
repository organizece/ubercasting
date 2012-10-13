module ApplicationHelper

  def states
    states = []
    states << ['', '']
    STATES.each { |state|
        states << [t(state, scope: :states), state]
    }
    
    states
  end

  # def sortable(column, title = nil)
  #   title ||= column.titleize
  #   css_class = column == sort_column ? "current #{sort_direction}" : nil
  #   direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  #   link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  # end

  def itens_per_page
    itens_per_page = []
    ITENS_PER_PAGE.each do |per_page|
      itens_per_page << [per_page, per_page]
    end

    itens_per_page
  end

end
