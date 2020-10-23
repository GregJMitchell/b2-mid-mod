class RideMechanicsController < ApplicationController
  def create
    ride = Ride.find_by(name: params[:mechanic][:ride])
    if ride.nil?
      redirect_to "/mechanics/#{params[:id]}"
      flash[:notice] = "Ride not added: Ride not found."
    else
      ride_mech = RideMechanic.create(ride_id: ride.id, mechanic_id: params[:id])
      if ride_mech.save
        redirect_to "/mechanics/#{params[:id]}"
      end
    end
  end
end