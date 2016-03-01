class FightsController < ApplicationController
  expose(:fights) { Fight.includes(:winner).includes(:losser) }
  expose(:fight, attributes: :fight_params)

  expose_decorated(:winner, decorator: FighterDecorator) { fight.winner }
  expose_decorated(:losser, decorator: FighterDecorator) { fight.losser }

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
