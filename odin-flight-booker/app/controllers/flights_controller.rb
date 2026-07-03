class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.code, a.id ] }
    @flight_dates = Flight.all.map { |f| [ f.departure_time.strftime("%m/%d/%Y"), f.departure_time.to_date ] }.uniq
    if params[:departure_airport_id].present?
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
      )
      if params[:flight_date].present?
        target_date = Date.parse(params[:flight_date])
        @flights = @flights.where(departure_time: target_date.all_day)
      end
    else
      @flights = []
    end
  end
end
