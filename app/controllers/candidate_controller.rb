class CandidateController < ApplicationController
  def create
    candidate = Candidate.new(candidate_params)
    candidate.user_id = current_user.id
    
    if !current_user
      flash[:warning] = "Could not create request"
      return
    end
    if candidate.save
      flash[:success] = "Request added successfully"
    else
      flash[:warning] = "Could not create request"
    end
    redirect_to "/"
  end

  def show
    canditate = Candidate.all.select("id, name, description, image, latitude, longitude, comment")
    render json: {result: canditate}
  end

  private

    def candidate_params
      params.require(:candidate).permit(:name, :description, :image, :latitude, :longitude, :comment)
    end
end
