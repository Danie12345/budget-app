class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user
  before_action :set_client

  # GET /operations or /operations.json
  def index
    @group = Group.find(params[:group_id])
    @operations = @group.operations
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params.except(:group_id))
    @group = Group.where(id: operation_params[:group_id]).first
    if @group.nil?
      return
    end
    if @operation.save
      @group.operations << @operation
      redirect_to group_operations_url(@group.id), notice: 'Operation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:name, :amount, :author_id, :group_id)
  end
end
