# frozen_string_literal: true

class MoneyTracksController < ApplicationController
  # actions
  def new
    @group = Group.find(params[:group_id])
    @money_track = MoneyTrack.new
  end

  def create
    @group = Group.find(group_id)
    @money_track = @group.add_money_track(required_params)
    redirect_to @group
  end

  private

  def group_id
    params.dig(:money_track, :group_id) || params[:group_id]
  end

  def required_params
    params.require(:money_track).permit(:name, :amount).merge(user: current_user)
  end
end
