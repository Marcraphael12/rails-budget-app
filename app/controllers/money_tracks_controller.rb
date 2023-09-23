class MoneyTracksController < ApplicationController
  def new
    # @group_id = group_id
    @group = Group.find(params[:group_id])

    @money_track = MoneyTrack.new
  end

  def create
    @group = Group.find(group_id)
    @money_track = @group.add_money_track(required_params)
    redirect_to @group

    # `rescue ActiveRecord::RecordInvalid` is a rescue clause that is used to handle an exception of
    # type `ActiveRecord::RecordInvalid`. This exception is raised when a record fails validation and
    # cannot be saved to the database. In this case, if the `@group.add_money_track(required_params)`
    # method raises a `RecordInvalid` exception, the code will redirect the user back to the `new`
    # action with the `group_id` parameter, allowing them to correct any validation errors and try
    # again.
    rescue ActiveRecord::RecordInvalid
    render :new, group_id: group_id
  end

  private

  def group_id
    params.dig(:money_track, :group_id) || params[:group_id]
  end

  def required_params
    params.require(:money_track).permit(:name, :amount).merge(user: current_user)
  end
end
