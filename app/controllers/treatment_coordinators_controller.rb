class TreatmentCoordinatorsController < ApplicationController
  before_action :set_treatment_coordinator, only: %i[ show edit update destroy ]

  # GET /treatment_coordinators or /treatment_coordinators.json
  def index
    @treatment_coordinators = TreatmentCoordinator.all
  end

  # GET /treatment_coordinators/1 or /treatment_coordinators/1.json
  def show
  end

  # GET /treatment_coordinators/new
  def new
    @treatment_coordinator = TreatmentCoordinator.new
  end

  # GET /treatment_coordinators/1/edit
  def edit
  end

  # POST /treatment_coordinators or /treatment_coordinators.json
  def create
    @treatment_coordinator = TreatmentCoordinator.new(treatment_coordinator_params)

    respond_to do |format|
      if @treatment_coordinator.save
        format.html { redirect_to treatment_coordinator_url(@treatment_coordinator), notice: "Treatment coordinator was successfully created." }
        format.json { render :show, status: :created, location: @treatment_coordinator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_coordinators/1 or /treatment_coordinators/1.json
  def update
    respond_to do |format|
      if @treatment_coordinator.update(treatment_coordinator_params)
        format.html { redirect_to treatment_coordinator_url(@treatment_coordinator), notice: "Treatment coordinator was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment_coordinator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_coordinators/1 or /treatment_coordinators/1.json
  def destroy
    @treatment_coordinator.destroy

    respond_to do |format|
      format.html { redirect_to treatment_coordinators_url, notice: "Treatment coordinator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_coordinator
      @treatment_coordinator = TreatmentCoordinator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_coordinator_params
      params.require(:treatment_coordinator).permit(:first_name, :last_name, :phone)
    end
end
