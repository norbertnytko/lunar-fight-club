class FightersController < ApplicationController
  expose_decorated(:fighters)
  expose_decorated(:fighter, attributes: :fighter_params)

  def create
    if fighter.save
      redirect_to fighter
    else
      render :new
    end
  end

  def update
    if fighter.save
      redirect_to fighter
    else
      render :edit
    end
  end

  private

  def fighter_params
    params.require(:fighter).permit(:first_name, :last_name, :description)
  end
end
