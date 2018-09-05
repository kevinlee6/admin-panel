class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  # GET /instructors
  # GET /instructors.json
  def index
    @instructors = Instructor.order(sort_column + ' ' + sort_direction)
  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
    authorize @instructor
  end

  # GET /instructors/new
  def new
    @instructor = Instructor.new
    authorize @instructor
  end

  # GET /instructors/1/edit
  def edit
    authorize @instructor
  end

  # POST /instructors
  # POST /instructors.json
  def create
    @instructor = Instructor.new(instructor_params)
    authorize @instructor

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
        format.json { render :show, status: :created, location: @instructor }
        @instructor.user = User.create(
          email: @instructor.first_name[0] + @instructor.last_name + @instructor.id.to_s + '@school.edu',
          password: 'password'
        )
        @instructor.user.add_role :instructor
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructors/1
  # PATCH/PUT /instructors/1.json
  def update
    authorize @instructor
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    authorize @instructor
    @instructor.destroy
    @instructors = Instructor.order(sort_column + ' ' + sort_direction)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :education, :cohort_id)
  end

  def sort_column
    Instructor.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
end
