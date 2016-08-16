class Season < ActiveRecord::Base
    belongs_to :show
    has_many :episodes
    
    def season_for_select
      "Season #{season_number}"
    end
end
