class AgenciesController < ActionController::Base
    before_filter :authenticate_agency!

    def show
        @agency = current_agency
    end

end