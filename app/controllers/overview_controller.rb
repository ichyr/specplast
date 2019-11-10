class OverviewController < ApplicationController
    def vmilist_export
        query = params["ids"].to_s.strip.downcase
        ids = query.split(',')
        @vmilists = ids && ids.length > 0 ?
            Vmilist.where(id: ids).order(id: :asc) :
            Vmilist.order(id: :asc)
        
        respond_to do |format|
            format.xls
        end
	end
end
