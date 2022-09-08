class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_client

  # GET /groups or /groups.json
  def index
    if @client.nil?
      redirect_to get_started_path
      return
    end
    @groups = current_user.groups
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    if @group.valid? && image_exists?(group_params[:icon])
      if @group.save
        redirect_to group_operations_path(@group.id), method: :get, notice: 'Group was successfully created!'
      end
    else
      render :new, status: :unprocessable_entity, notice: 'Cannot create group with provided info!'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon).merge(user_id: @client.id)
  end
end
