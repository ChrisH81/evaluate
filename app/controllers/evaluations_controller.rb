class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :set_student

  def index
    @evaluations = Evaluation.all
  end

  def show
  @evaluation = Evaluation.find(params[:id])
  @student = Student.find(@evaluation.student_id)
  end

  def new
    @evaluation = Evaluation.new
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.student_id = @student.id

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation.student.batch, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation.student.batch, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to @evaluation.student.batch, notice: 'Evaluation was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:score, :comment, :date, :student_id)
  end
end
