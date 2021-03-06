# frozen_string_literal: true

class CohortsController < ApplicationController
  before_action :set_cohort, only: %i[show edit update destroy addstudent poststudent removestudent addinstructor]

  # GET /cohorts
  # GET /cohorts.json
  def index
    @cohorts = Cohort.includes(:course).order(sort_column + ' ' + sort_direction)
  end

  # GET /cohorts/1
  # GET /cohorts/1.json
  def show
    @students = @cohort.students.order(:last_name)
    @instructor = @cohort.instructor
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
    authorize @cohort
  end

  # GET /cohorts/1/edit
  def edit
    authorize @cohort
  end

  def addstudent
    students = Student.all
    @students_left = students.order(:last_name).reject do |student|
      @cohort.students.include?(student)
    end
  end

  def poststudent
    added = CohortStudent.create!(
      student_id: params[:student_id],
      cohort_id: params[:id]
    )

    respond_to do |format|
      if added.save
        format.html { redirect_to @cohort, notice: 'Student was successfully added.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  def removestudent
    CohortStudent.where(cohort_id: params[:id]).find_by(student_id: params[:student_id]).destroy
    redirect_to cohort_path(@cohort)
  end

  def addinstructor
    @cohort.instructor = Instructor.find(params[:instructor_id])
    redirect_to cohort_path(@cohort)
  end

  # POST /cohorts
  # POST /cohorts.json
  def create
    @cohort = Cohort.new(cohort_params)

    respond_to do |format|
      if @cohort.save
        format.html { redirect_to @cohort, notice: 'Cohort was successfully created.' }
        format.json { render :show, status: :created, location: @cohort }
      else
        format.html { render :new }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cohorts/1
  # PATCH/PUT /cohorts/1.json
  def update
    respond_to do |format|
      if @cohort.update(cohort_params)
        format.html { redirect_to @cohort, notice: 'Cohort was successfully updated.' }
        format.json { render :show, status: :ok, location: @cohort }
      else
        format.html { render :edit }
        format.json { render json: @cohort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cohorts/1
  # DELETE /cohorts/1.json
  def destroy
    authorize @cohort
    @cohort.destroy
    @cohorts = Cohort.order(sort_column + ' ' + sort_direction)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cohort_params
    params.require(:cohort).permit(:name, :course_id, :start_date, :end_date)
  end

  def sort_column
    Cohort.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end
end
