class OperationsController < ApplicationController
  before_action :authenticate_user!
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
    @operation = Operation.new(operation_params.except(:group_ids))
    @groups = Group.where(id: operation_params[:group_ids])
    if @groups.empty?
      redirect_to new_operation_path, notice: 'Operations need at least 1 group!'
    elsif @operation.save
      @groups.each do |group|
        group.operations << @operation
      end
      redirect_to root_path, notice: 'Operation was successfully created!'
    else
      redirect_to new_operation_path, notice: 'Cannot create operation with provided info!'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: []).merge(author_id: @client.id)
  end
end
