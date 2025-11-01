require "application_system_test_case"

class AssessmentsTest < ApplicationSystemTestCase
  setup do
    @assessment = assessments(:one)
  end

  test "visiting the index" do
    visit assessments_url
    assert_selector "h1", text: "Assessments"
  end

  test "should create assessment" do
    visit assessments_url
    click_on "New assessment"

    fill_in "Aspect", with: @assessment.aspect
    fill_in "Assessment date", with: @assessment.assessment_date
    fill_in "Assessor name", with: @assessment.assessor_name
    fill_in "Bld ext", with: @assessment.bld_ext
    fill_in "Bridge weight", with: @assessment.bridge_weight
    fill_in "Clean", with: @assessment.clean
    fill_in "Comb mat", with: @assessment.comb_mat
    fill_in "Contfuel", with: @assessment.contfuel
    fill_in "Decks", with: @assessment.decks
    fill_in "Drivelen", with: @assessment.drivelen
    fill_in "Driveway width", with: @assessment.driveway_width
    fill_in "Eaves", with: @assessment.eaves
    fill_in "Ff risk access", with: @assessment.ff_risk_access
    fill_in "Ff risk escape safety", with: @assessment.ff_risk_escape_safety
    fill_in "Ff risk hazmat", with: @assessment.ff_risk_hazmat
    fill_in "Ff risk ohpower", with: @assessment.ff_risk_ohpower
    fill_in "Ff risk pets", with: @assessment.ff_risk_pets
    fill_in "Ff risk propgas", with: @assessment.ff_risk_propgas
    fill_in "Ff risk solar", with: @assessment.ff_risk_solar
    fill_in "Fveg z1", with: @assessment.fveg_z1
    fill_in "Fveg z2", with: @assessment.fveg_z2
    fill_in "Gate", with: @assessment.gate
    fill_in "Ing egg", with: @assessment.ing_egg
    fill_in "Lad fl1", with: @assessment.lad_fl1
    fill_in "Lad fuel 2", with: @assessment.lad_fuel_2
    fill_in "Latitude", with: @assessment.latitude
    fill_in "Longitude", with: @assessment.longitude
    fill_in "Notes", with: @assessment.notes
    fill_in "Parcel number", with: @assessment.parcel_number
    fill_in "Pos slope", with: @assessment.pos_slope
    fill_in "Propane", with: @assessment.propane
    fill_in "Property address", with: @assessment.property_address
    fill_in "Risk category", with: @assessment.risk_category
    fill_in "Road cond", with: @assessment.road_cond
    fill_in "Roof", with: @assessment.roof
    fill_in "Setback", with: @assessment.setback
    fill_in "Site water", with: @assessment.site_water
    fill_in "Slope", with: @assessment.slope
    fill_in "Struct alignment", with: @assessment.struct_alignment
    fill_in "Sveg z1", with: @assessment.sveg_z1
    fill_in "Sveg z2", with: @assessment.sveg_z2
    fill_in "Total score", with: @assessment.total_score
    fill_in "Turn", with: @assessment.turn
    fill_in "Vents", with: @assessment.vents
    click_on "Create Assessment"

    assert_text "Assessment was successfully created"
    click_on "Back"
  end

  test "should update Assessment" do
    visit assessment_url(@assessment)
    click_on "Edit this assessment", match: :first

    fill_in "Aspect", with: @assessment.aspect
    fill_in "Assessment date", with: @assessment.assessment_date
    fill_in "Assessor name", with: @assessment.assessor_name
    fill_in "Bld ext", with: @assessment.bld_ext
    fill_in "Bridge weight", with: @assessment.bridge_weight
    fill_in "Clean", with: @assessment.clean
    fill_in "Comb mat", with: @assessment.comb_mat
    fill_in "Contfuel", with: @assessment.contfuel
    fill_in "Decks", with: @assessment.decks
    fill_in "Drivelen", with: @assessment.drivelen
    fill_in "Driveway width", with: @assessment.driveway_width
    fill_in "Eaves", with: @assessment.eaves
    fill_in "Ff risk access", with: @assessment.ff_risk_access
    fill_in "Ff risk escape safety", with: @assessment.ff_risk_escape_safety
    fill_in "Ff risk hazmat", with: @assessment.ff_risk_hazmat
    fill_in "Ff risk ohpower", with: @assessment.ff_risk_ohpower
    fill_in "Ff risk pets", with: @assessment.ff_risk_pets
    fill_in "Ff risk propgas", with: @assessment.ff_risk_propgas
    fill_in "Ff risk solar", with: @assessment.ff_risk_solar
    fill_in "Fveg z1", with: @assessment.fveg_z1
    fill_in "Fveg z2", with: @assessment.fveg_z2
    fill_in "Gate", with: @assessment.gate
    fill_in "Ing egg", with: @assessment.ing_egg
    fill_in "Lad fl1", with: @assessment.lad_fl1
    fill_in "Lad fuel 2", with: @assessment.lad_fuel_2
    fill_in "Latitude", with: @assessment.latitude
    fill_in "Longitude", with: @assessment.longitude
    fill_in "Notes", with: @assessment.notes
    fill_in "Parcel number", with: @assessment.parcel_number
    fill_in "Pos slope", with: @assessment.pos_slope
    fill_in "Propane", with: @assessment.propane
    fill_in "Property address", with: @assessment.property_address
    fill_in "Risk category", with: @assessment.risk_category
    fill_in "Road cond", with: @assessment.road_cond
    fill_in "Roof", with: @assessment.roof
    fill_in "Setback", with: @assessment.setback
    fill_in "Site water", with: @assessment.site_water
    fill_in "Slope", with: @assessment.slope
    fill_in "Struct alignment", with: @assessment.struct_alignment
    fill_in "Sveg z1", with: @assessment.sveg_z1
    fill_in "Sveg z2", with: @assessment.sveg_z2
    fill_in "Total score", with: @assessment.total_score
    fill_in "Turn", with: @assessment.turn
    fill_in "Vents", with: @assessment.vents
    click_on "Update Assessment"

    assert_text "Assessment was successfully updated"
    click_on "Back"
  end

  test "should destroy Assessment" do
    visit assessment_url(@assessment)
    click_on "Destroy this assessment", match: :first

    assert_text "Assessment was successfully destroyed"
  end
end
