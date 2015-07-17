require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post :create, incident: { actual_start_date_and_time: @incident.actual_start_date_and_time, affected_departments: @incident.affected_departments, from: @incident.from, incident_number: @incident.incident_number, incident_responsibility: @incident.incident_responsibility, priority: @incident.priority, recorded_start_date_and_time: @incident.recorded_start_date_and_time, resolution: @incident.resolution, resolved: @incident.resolved, responsible_service_support_resource_group: @incident.responsible_service_support_resource_group, service_impact: @incident.service_impact, status: @incident.status, to: @incident.to, update_number: @incident.update_number }
    end

    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should show incident" do
    get :show, id: @incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident
    assert_response :success
  end

  test "should update incident" do
    patch :update, id: @incident, incident: { actual_start_date_and_time: @incident.actual_start_date_and_time, affected_departments: @incident.affected_departments, from: @incident.from, incident_number: @incident.incident_number, incident_responsibility: @incident.incident_responsibility, priority: @incident.priority, recorded_start_date_and_time: @incident.recorded_start_date_and_time, resolution: @incident.resolution, resolved: @incident.resolved, responsible_service_support_resource_group: @incident.responsible_service_support_resource_group, service_impact: @incident.service_impact, status: @incident.status, to: @incident.to, update_number: @incident.update_number }
    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete :destroy, id: @incident
    end

    assert_redirected_to incidents_path
  end
end
