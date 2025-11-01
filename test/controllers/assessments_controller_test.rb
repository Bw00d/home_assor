require "test_helper"

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment = assessments(:one)
  end

  test "should get index" do
    get assessments_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_url
    assert_response :success
  end

  test "should create assessment" do
    assert_difference("Assessment.count") do
      post assessments_url, params: { assessment: { aspect: @assessment.aspect, assessment_date: @assessment.assessment_date, assessor_name: @assessment.assessor_name, bld_ext: @assessment.bld_ext, bridge_weight: @assessment.bridge_weight, clean: @assessment.clean, comb_mat: @assessment.comb_mat, contfuel: @assessment.contfuel, decks: @assessment.decks, drivelen: @assessment.drivelen, driveway_width: @assessment.driveway_width, eaves: @assessment.eaves, ff_risk_access: @assessment.ff_risk_access, ff_risk_escape_safety: @assessment.ff_risk_escape_safety, ff_risk_hazmat: @assessment.ff_risk_hazmat, ff_risk_ohpower: @assessment.ff_risk_ohpower, ff_risk_pets: @assessment.ff_risk_pets, ff_risk_propgas: @assessment.ff_risk_propgas, ff_risk_solar: @assessment.ff_risk_solar, fveg_z1: @assessment.fveg_z1, fveg_z2: @assessment.fveg_z2, gate: @assessment.gate, ing_egg: @assessment.ing_egg, lad_fl1: @assessment.lad_fl1, lad_fuel_2: @assessment.lad_fuel_2, latitude: @assessment.latitude, longitude: @assessment.longitude, notes: @assessment.notes, parcel_number: @assessment.parcel_number, pos_slope: @assessment.pos_slope, propane: @assessment.propane, property_address: @assessment.property_address, risk_category: @assessment.risk_category, road_cond: @assessment.road_cond, roof: @assessment.roof, setback: @assessment.setback, site_water: @assessment.site_water, slope: @assessment.slope, struct_alignment: @assessment.struct_alignment, sveg_z1: @assessment.sveg_z1, sveg_z2: @assessment.sveg_z2, total_score: @assessment.total_score, turn: @assessment.turn, vents: @assessment.vents } }
    end

    assert_redirected_to assessment_url(Assessment.last)
  end

  test "should show assessment" do
    get assessment_url(@assessment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_url(@assessment)
    assert_response :success
  end

  test "should update assessment" do
    patch assessment_url(@assessment), params: { assessment: { aspect: @assessment.aspect, assessment_date: @assessment.assessment_date, assessor_name: @assessment.assessor_name, bld_ext: @assessment.bld_ext, bridge_weight: @assessment.bridge_weight, clean: @assessment.clean, comb_mat: @assessment.comb_mat, contfuel: @assessment.contfuel, decks: @assessment.decks, drivelen: @assessment.drivelen, driveway_width: @assessment.driveway_width, eaves: @assessment.eaves, ff_risk_access: @assessment.ff_risk_access, ff_risk_escape_safety: @assessment.ff_risk_escape_safety, ff_risk_hazmat: @assessment.ff_risk_hazmat, ff_risk_ohpower: @assessment.ff_risk_ohpower, ff_risk_pets: @assessment.ff_risk_pets, ff_risk_propgas: @assessment.ff_risk_propgas, ff_risk_solar: @assessment.ff_risk_solar, fveg_z1: @assessment.fveg_z1, fveg_z2: @assessment.fveg_z2, gate: @assessment.gate, ing_egg: @assessment.ing_egg, lad_fl1: @assessment.lad_fl1, lad_fuel_2: @assessment.lad_fuel_2, latitude: @assessment.latitude, longitude: @assessment.longitude, notes: @assessment.notes, parcel_number: @assessment.parcel_number, pos_slope: @assessment.pos_slope, propane: @assessment.propane, property_address: @assessment.property_address, risk_category: @assessment.risk_category, road_cond: @assessment.road_cond, roof: @assessment.roof, setback: @assessment.setback, site_water: @assessment.site_water, slope: @assessment.slope, struct_alignment: @assessment.struct_alignment, sveg_z1: @assessment.sveg_z1, sveg_z2: @assessment.sveg_z2, total_score: @assessment.total_score, turn: @assessment.turn, vents: @assessment.vents } }
    assert_redirected_to assessment_url(@assessment)
  end

  test "should destroy assessment" do
    assert_difference("Assessment.count", -1) do
      delete assessment_url(@assessment)
    end

    assert_redirected_to assessments_url
  end
end
