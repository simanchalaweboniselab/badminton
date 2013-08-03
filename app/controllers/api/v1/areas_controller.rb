class Api::V1::AreasController < ApplicationController
  respond_to :json

  def all_areas
    @areas = Area.select([:id, :name]);
    respond_with do |format|
      if(User.check_auth_key)
        format.json {render :json => {:success => true }}
      else
        format.json {render :json => {:success => false}}
      end
    end
  end

end
