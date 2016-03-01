class FightsController < ApplicationController
  expose(:fights)
  expose(:fight, attributes: :fight_params)
  expose(:fighters) { fight.fighters }

  expose(:winner) { fight.winner }
  expose(:losser) { fight.losser }

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
