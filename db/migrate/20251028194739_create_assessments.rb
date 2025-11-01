class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      # Basic Information
      t.string :parcel_number
      t.date :assessment_date
      t.string :assessor_name
      t.string :property_address
      
      # Access Attributes
      t.integer :gate # Locked Gate blocking access (1-3)
      t.integer :ing_egg # Ingress and Egress (1-3)
      t.integer :road_cond # All-Season Road Condition (1-3)
      t.integer :bridge_weight # Bridge Weight Limits (1-2)
      t.integer :driveway_width # Width of Driveway (1-3)
      t.integer :drivelen # Length of Driveway (1-4)
      t.integer :turn # Adequate Turnaround (1-2)
      
      # Structure Attributes
      t.integer :roof # Roofing Material (1-4)
      t.integer :clean # Roof Cleanliness (1-2)
      t.integer :eaves # Eaves (1-3)
      t.integer :vents # Vents (1-2)
      t.integer :bld_ext # Exterior Walls (1-4)
      t.integer :decks # Decks and Porches (1-3)
      t.integer :comb_mat # Combustibles (1-3)
      t.integer :propane # Propane Clearance (1-2)
      t.integer :site_water # Onsite Water Source (1-2)
      
      # Vegetation Zone 1 (< 30 feet)
      t.integer :fveg_z1 # Tree Canopy Zone 1 (1-3)
      t.integer :sveg_z1 # Surface Veg Zone 1 (1-4)
      t.integer :lad_fl1 # Ladder Fuels Zone 1 (1-2)
      
      # Vegetation Zone 2 (30-100 feet)
      t.integer :fveg_z2 # Tree Canopy Zone 2 (1-3)
      t.integer :sveg_z2 # Surface Veg Zone 2 (1-4)
      t.integer :lad_fuel_2 # Ladder Fuels Zone 2 (1-2)
      
      # Topography
      t.integer :contfuel # Surface Fuel Continuous Fire Path (1-3)
      t.integer :struct_alignment # Structure in Alignment with Dangerous Topo (1-2)
      t.integer :slope # Slope within 150 Feet (1-4)
      t.integer :setback # Structure Setback from Edge of Slope (1-3)
      t.integer :pos_slope # Structure Position on Slope (1-4)
      t.integer :aspect # Predominant Aspect (1-4)
      
      # Firefighter Risk Factors
      t.integer :ff_risk_access # Access Risk to FFs
      t.integer :ff_risk_propgas # Propane or Gas Risk to FFs
      t.integer :ff_risk_ohpower # Overhead power Risk to FFs
      t.integer :ff_risk_pets # Pets Risk to FFs
      t.integer :ff_risk_hazmat # HazMat Risk to FFs
      t.integer :ff_risk_escape_safety # Poor escape Risk to FFs
      t.integer :ff_risk_solar # Solar Elec Risk to FFs
      
      # Calculated Fields
      t.integer :risk_category # 0=low, 1=moderate, 2=high, 3=structure_only
      t.decimal :total_score, precision: 10, scale: 2
      
      # Additional Information
      t.text :notes
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      
      t.timestamps
    end
    
    # Add indexes for better performance
    add_index :assessments, :parcel_number
    add_index :assessments, :assessment_date
    add_index :assessments, :risk_category
    add_index :assessments, [:latitude, :longitude]
  end
end