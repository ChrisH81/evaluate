class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :set_student

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
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @student.batch, notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to @evaluation.student.batch, notice: 'Evaluation was successfully removed.' }
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
