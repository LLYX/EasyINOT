class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.order(:updated_at)
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    @departments = @incident.affected_departments.gsub(/\r\n?/, "\n").split("\n")
    @departments.length.times do |i|
      @departments[i] = Department.exists?(english_name: @departments[i]) ? Department.where(english_name: @departments[i]).take.french_name : @departments[i]
    end
    @departments = @departments.join("\n")
    
    @groups = @incident.responsible_service_support_resource_group.gsub(/\r\n?/, "\n").split("\n")
    @groups.length.times do |i|
      @groups[i] = Group.exists?(english_name: @groups[i]) ? Group.where(english_name: @groups[i]).take.french_name : @groups[i]
    end
    @groups = @groups.join("\n")
    
    @responsible = @incident.incident_responsibility.gsub(/\r\n?/, "\n").split("\n")
    @responsible.length.times do |i|
      @responsible[i] = Department.exists?(english_name: @responsible[i]) ? Department.where(english_name: @responsible[i]).take.french_name : @responsible[i]
    end
    @responsible = @responsible.join("\n")
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)

    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:from, :to, :update_number, :priority, :affected_departments, :service_impact, :responsible_service_support_resource_group, :resolved, :status, :resolution, :incident_number, :actual_start_date_and_time, :recorded_start_date_and_time, :resolved_date_and_time, :incident_responsibility)
    end
end
