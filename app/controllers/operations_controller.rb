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
    if !@operation.valid?
      flash.now[:notice] = 'Can\'t create operation with missing info!'
      render :new, status: :unprocessable_entity
    elsif @groups.empty?
      flash.now[:notice] = 'Operations need at least 1 group!'
      render :new, status: :unprocessable_entity
    elsif @operation.save
      @groups.each do |group|
        group.operations << @operation
      end
      flash[:notice] = 'Operation was created successfully!'
      redirect_to root_path
    else
      flash.now[:notice] = 'Something went wrong :c'
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: []).merge(author_id: @client.id)
  end
end
