class GroupController < ApplicationRecord

	# Actions
	def new
		@group = Goup.new
	end

	def index
    @groups = Group.where(params[:id]).order(created_at: 'DESC')
  end

	def show
    @group = Group.find(params[:id])
    @group_money_tracks = @group.money_tracks.order(created_at: 'DESC')
  end

  def create
    @group = current_user.groups.create(required_params)
		# checking if the `@group` object was successfully saved to the database. If it was saved
		# successfully, it redirects the user to the `moneytrack_path`. If it was not saved successfully, it
		# renders the `new` view again, allowing the user to correct any errors and try saving again.
    if @group.save
      redirect_to moneytrack_path
    else
      render :new
    end
  end

	# Params
	def required_params
    params.require(:group).permit(:name, :icon)
  end
end
