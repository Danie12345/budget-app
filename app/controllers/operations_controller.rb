class OperationsController < ApplicationController
  before_action :require_user

  # GET /operations or /operations.json
  def index
    @operations = Group.find(params[:group_id]).operations
  end

  # GET /operations/new
  def new
    @client = current_user
    @operation = Operation.new
  end

  # POST /operations or /operations.json
  def create
    @operation = Operation.new(operation_params)
    @group = Group.find(id: params[:group_id])

    respond_to do |format|
      if @operation.save
        @group.operations << @operation
        format.html { redirect_to operation_url(@operation), notice: 'Operation was successfully created.' }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:name, :amount, :author_id)
  end
end
