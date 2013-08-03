class Court < ActiveRecord::Base
  attr_accessible :address, :area_id, :name, :phone_number
  belongs_to :area

  def self.court_details(courts)
    @courts = []
    courts.each do |court|
      hash = {:name =>court.name, :ph => court.phone_number, :area => court.area.name}
      @courts.push(hash);
    end
    @courts
  end

end
