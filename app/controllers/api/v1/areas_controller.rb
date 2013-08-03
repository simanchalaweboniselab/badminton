class Api::V1::AreasController < ApplicationController
  respond_to :json

  def all_areas
    @areas = Area.select([:id, :name, :langitude, :latitude]);
    respond_with do |format|
      if(User.find_by_auth_key(params[:auth_key]))
        format.json {render :json => {:success => true, :area => @areas }}
      else
        format.json {render :json => {:success => false}}
      end
    end
  end

end
