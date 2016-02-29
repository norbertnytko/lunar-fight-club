class FightsController < ApplicationController
  expose(:fights)
  expose(:fight, attributes: :fight_params)
  expose_decorated(:fighters) { fight.fighters}

  def create
    if fight.save
      redirect_to fight
    else
      render :new
    end
  end

  private

  def fight_params
    params.require(:fight).permit(fighter_ids: [])
  end
end
