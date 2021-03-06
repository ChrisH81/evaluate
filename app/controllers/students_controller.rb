class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_batch

  def index
    @students = Student.all
  end

  def show
  @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.batch_id = @batch.id

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student.batch, notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @batch, notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to @student.batch, notice: 'Student was successfully removed.' }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def set_evalution
    @evalution = Evalution.find(params[:id])
  end

  def set_batch
    @batch = Batch.find(params[:batch_id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :image, :batch_id)
  end
end
