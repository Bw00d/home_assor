class AssessmentsController < ApplicationController
  before_action :set_assessment, only: %i[ show edit update destroy ]

  # GET /assessments
  def index
    @assessments = Assessment.all
  end

  # GET /assessments/1
  def show
  end

  # GET /assessments/new
  def new
    @assessment = Assessment.new
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments
  def create
    @assessment = Assessment.new(assessment_params)

    if @assessment.save
      redirect_to @assessment, notice: "Assessment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assessments/1
  def update
    if @assessment.update(assessment_params)
      redirect_to @assessment, notice: "Assessment was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /assessments/1
  def destroy
    @assessment.destroy!
    redirect_to assessments_path, notice: "Assessment was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def assessment_params
      params.expect(assessment: [ :parcel_number, :assessment_date, :assessor_name, :property_address, :gate, :ing_egg, :road_cond, :bridge_weight, :driveway_width, :drivelen, :turn, :roof, :clean, :eaves, :vents, :bld_ext, :decks, :comb_mat, :propane, :site_water, :fveg_z1, :sveg_z1, :lad_fl1, :fveg_z2, :sveg_z2, :lad_fuel_2, :contfuel, :struct_alignment, :slope, :setback, :pos_slope, :aspect, :ff_risk_access, :ff_risk_propgas, :ff_risk_ohpower, :ff_risk_pets, :ff_risk_hazmat, :ff_risk_escape_safety, :ff_risk_solar, :risk_category, :total_score, :notes, :latitude, :longitude ])
    end
end
