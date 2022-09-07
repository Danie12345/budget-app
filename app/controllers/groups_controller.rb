class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user
  before_action :set_client

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_operations_path(@group.id), method: :get, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
