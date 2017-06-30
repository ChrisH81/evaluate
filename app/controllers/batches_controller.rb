class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :destroy]


  def index
    @batches = Batch.all
  end

  def show
  end

  def new
    @batch = Batch.new
  end

  def edit
  end

  def create
    @batch = Batch.new(batch_params)
      if @batch.save
        redirect_to root_path, notice: 'Batch was successfully created.'
      else
        format.html { render :new }
      end
  end

  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully removed.' }
    end
  end

  private

    def set_batch
      @batch = Batch.find(params[:id])
    end

    def batch_params
      params.require(:batch).permit(:name, :start_date, :end_date)
    end
end
