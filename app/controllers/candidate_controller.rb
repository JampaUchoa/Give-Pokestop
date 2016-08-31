class CandidateController < ApplicationController
  def create
    candidate = Candidate.new(candidate_params)
    if candidate.save
      #
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
