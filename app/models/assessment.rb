# app/models/assessment.rb
class Assessment < ApplicationRecord
  # Associations
  belongs_to :user, optional: true

  # Validations
  validates :parcel_number, presence: true
  validates :assessment_date, presence: true
  validates :assessor_name, presence: true
  validates :property_address, presence: true
  
  # Value ranges for each attribute based on the spreadsheet
  validates :gate, inclusion: { in: 1..3 }, allow_nil: true
  validates :ing_egg, inclusion: { in: 1..2 }, allow_nil: true
  validates :road_cond, inclusion: { in: 1..4 }, allow_nil: true
  validates :bridge_weight, inclusion: { in: 1..2 }, allow_nil: true
  validates :driveway_width, inclusion: { in: 1..3 }, allow_nil: true
  validates :drivelen, inclusion: { in: 1..3 }, allow_nil: true
  validates :turn, inclusion: { in: 1..2 }, allow_nil: true
  validates :roof, inclusion: { in: 1..3 }, allow_nil: true
  validates :clean, inclusion: { in: 1..3 }, allow_nil: true
  validates :eaves, inclusion: { in: 1..3 }, allow_nil: true
  validates :vents, inclusion: { in: 1..4 }, allow_nil: true
  validates :bld_ext, inclusion: { in: 1..3 }, allow_nil: true
  validates :decks, inclusion: { in: 1..3 }, allow_nil: true
  validates :comb_mat, inclusion: { in: 1..2 }, allow_nil: true
  validates :propane, inclusion: { in: 1..2 }, allow_nil: true
  validates :site_water, inclusion: { in: 1..2 }, allow_nil: true
  validates :fveg_z1, inclusion: { in: 1..3 }, allow_nil: true
  validates :sveg_z1, inclusion: { in: 1..5 }, allow_nil: true
  validates :lad_fl1, inclusion: { in: 1..3 }, allow_nil: true
  validates :fveg_z2, inclusion: { in: 1..3 }, allow_nil: true
  validates :sveg_z2, inclusion: { in: 1..5 }, allow_nil: true
  validates :lad_fuel_2, inclusion: { in: 1..3 }, allow_nil: true
  validates :contfuel, inclusion: { in: 1..2 }, allow_nil: true
  validates :struct_alignment, inclusion: { in: 1..2 }, allow_nil: true
  validates :slope, inclusion: { in: 1..4 }, allow_nil: true
  validates :setback, inclusion: { in: 1..3 }, allow_nil: true
  validates :pos_slope, inclusion: { in: 1..4 }, allow_nil: true
  validates :aspect, inclusion: { in: 1..5 }, allow_nil: true
  
  # Callbacks
  before_save :calculate_total_score
  before_save :determine_risk_category
  
  # Enums for display values
  enum :risk_category, { 
	  low: 0,
	  moderate: 1,
	  high: 2,
	  structure_only: 3
	}, prefix: true

  # Attribute descriptions
  ATTRIBUTE_DESCRIPTIONS = {
    gate: "Locked Gate blocking access",
    ing_egg: "Ingress and Egress",
    road_cond: "All-Season Road Condition",
    bridge_weight: "Bridge Weight Limits",
    driveway_width: "Width of Driveway",
    drivelen: "Length of Driveway",
    turn: "Adequate Turnaround",
    roof: "Roofing Material",
    clean: "Roof Cleanliness",
    eaves: "Eaves",
    vents: "Vents",
    bld_ext: "Exterior Walls",
    decks: "Decks and Porches",
    comb_mat: "Combustibles",
    propane: "Propane Clearance",
    site_water: "Onsite Water Source",
    fveg_z1: "Tree Canopy Zone 1 (< 30 feet)",
    sveg_z1: "Surface Veg Zone 1 (< 30 feet)",
    lad_fl1: "Ladder Fuels Zone 1 (< 30 feet)",
    fveg_z2: "Tree Canopy Zone 2 (30-100 feet)",
    sveg_z2: "Surface Veg Zone 2 (30-100 feet)",
    lad_fuel_2: "Ladder Fuels Zone 2 (30-100 feet)",
    contfuel: "Surface Fuel Continuous Fire Path",
    struct_alignment: "Structure in Alignment with Dangerous Topography",
    slope: "Slope within 150 Feet",
    setback: "Structure Setback from Edge of Slope",
    pos_slope: "Structure Position on Slope",
    aspect: "Predominant Aspect",
    ff_risk_access: "Access Risk to Firefighters",
    ff_risk_propgas: "Propane or Gas Risk to Firefighters",
    ff_risk_ohpower: "Overhead Power Risk to Firefighters",
    ff_risk_pets: "Pets Risk to Firefighters",
    ff_risk_hazmat: "HazMat Risk to Firefighters",
    ff_risk_escape_safety: "Poor Escape Risk to Firefighters",
    ff_risk_solar: "Solar Electric Risk to Firefighters"
  }.freeze
  
  # Score weights from the spreadsheet
  SCORE_WEIGHTS = {
    # Access scores (positive values = higher risk)
    gate: { 1 => 0.0, 2 => 0.666667, 3 => 1.666667 },
    ing_egg: { 1 => 0.0, 2 => 0.833333 },
    road_cond: { 1 => 0.0, 2 => 0.666667, 3 => 2.666667, 4=> 3.333333 },
    bridge_weight: { 1 => 0.0, 2 => 1.666666 },
    driveway_width: { 1 => 1.666667, 2 => 1, 3 => 0.0 },
    drivelen: { 1 => 1.666667, 2 => 0, 3 => 1},
    turn: { 1 => 0.0, 2 => 3.333333 },
    
    # Structure scores (negative values = lower risk)
    roof: { 1 => -3.333333, 2 => -3.3333, 3 => 3.333333},
    clean: { 1 => -1.666667, 2 => 1, 3 => 1.666667 },
    eaves: { 1 => -1.666667, 2 => 1.666667, 3 => 0.0 },
    vents: { 1 => -1.666667, 2 => 0.0, 3 => 1.666667, 4 => 0 },
    bld_ext: { 1 => -1.666667, 2 => 1.666667, 3 => 3.333333},
    decks: { 1 => 0.0, 2 => 1.6666667, 3 => 3.333333 },
    comb_mat: { 1 => -1.666667, 2 => 1.666667 },
    propane: { 1 => 0.0, 2 => 1.666667 },
    site_water: { 1 => 0, 2 => 1.666667 },
    
    # Vegetation scores
    fveg_z1: { 1 => -1.666667, 2 => -0.833333, 3 => 3.333333 },
    sveg_z1: { 1 => -3.333333, 2 => 0, 3 => 1.333333, 4 => 2.666667, 5 => 3.333333 },
    lad_fl1: { 1 => -1.666667, 2 => 0.0, 3 => 1.666667 },
    fveg_z2: { 1 => -1.666667, 2 => -0.833333, 3 => 3.333333},
    sveg_z2: { 1 => -1.66667, 2 => 0, 3 => 0.666667, 4 => 1.333333, 5 => 1.666667 },
    lad_fuel_2: { 1 => -1.666667, 2 => 0.0, 3 => 1.666667 },
    
    # Topography scores
    contfuel: { 3 => 3.333333, 2 => 0.0 },
    struct_alignment: { 2 => 1.666667, 1 => 0.0 },
    slope: { 1 => 0.0, 2 => 0.416667, 3 => 0.833333, 4 => 1.666667 },
    setback: { 1 => 0.0, 2 => 0.833333, 3 => 1.666667 },
    pos_slope: { 1 => 0.0, 2 => 0.666667, 3 => 1, 4 => 1.666667 },
    aspect: { 1 => 0.0, 2 => 0.666667, 3 => 1, 4 => 1.666667, 5 => 1.666667 }
  }.freeze
  
  # Calculate total risk score
  def calculate_total_score
    score = 0.0
    
    SCORE_WEIGHTS.each do |attribute, weights|
      value = send(attribute)
      score += weights[value] if value.present? && weights[value]
    end
    
    # Add firefighter risk scores (these are binary)
    firefighter_risks = [
      ff_risk_access,
      ff_risk_propgas,
      ff_risk_ohpower,
      ff_risk_pets,
      ff_risk_hazmat,
      ff_risk_escape_safety,
      ff_risk_solar
    ]
    
    firefighter_risks.each do |risk|
      score += 3.333333 if risk == 1
    end
    
    self.total_score = score.round(2)
  end
  
  # Determine risk category based on total score
  def determine_risk_category
    return unless total_score.present?
    
    # These thresholds should be adjusted based on your specific requirements
    self.risk_category = case total_score
                        when -Float::INFINITY...-10
                          'low'
                        when -10...0
                          'moderate'
                        when 0...10
                          'high'
                        else
                          'high'
                        end
  end
  
  # Helper methods
  def access_risk_score
    score = 0.0
    [:gate, :ing_egg, :road_cond, :bridge_weight, :driveway_width, :drivelen, :turn].each do |attr|
      value = send(attr)
      score += SCORE_WEIGHTS[attr][value] if value.present? && SCORE_WEIGHTS[attr][value]
    end
    score.round(2)
  end
  
  def structure_risk_score
    score = 0.0
    [:roof, :clean, :eaves, :vents, :bld_ext, :decks, :comb_mat, :propane, :site_water].each do |attr|
      value = send(attr)
      score += SCORE_WEIGHTS[attr][value] if value.present? && SCORE_WEIGHTS[attr][value]
    end
    score.round(2)
  end
  
  def vegetation_risk_score
    score = 0.0
    [:fveg_z1, :sveg_z1, :lad_fl1, :fveg_z2, :sveg_z2, :lad_fuel_2].each do |attr|
      value = send(attr)
      score += SCORE_WEIGHTS[attr][value] if value.present? && SCORE_WEIGHTS[attr][value]
    end
    score.round(2)
  end
  
  def topography_risk_score
    score = 0.0
    [:contfuel, :struct_alignment, :slope, :setback, :pos_slope, :aspect].each do |attr|
      value = send(attr)
      score += SCORE_WEIGHTS[attr][value] if value.present? && SCORE_WEIGHTS[attr][value]
    end
    score.round(2)
  end
  
  def firefighter_risk_count
    count = 0
    [ff_risk_access, ff_risk_propgas, ff_risk_ohpower, ff_risk_pets, 
     ff_risk_hazmat, ff_risk_escape_safety, ff_risk_solar].each do |risk|
      count += 1 if risk == 1
    end
    count
  end

  def risk_category_label
	RISK_CATEGORY_LABELS[risk_category] || risk_category&.humanize
  end
  
  # Scopes
  scope :high_risk, -> { where(risk_category: 'high') }
  scope :moderate_risk, -> { where(risk_category: 'moderate') }
  scope :low_risk, -> { where(risk_category: 'low') }
  scope :recent, -> { order(assessment_date: :desc) }
  scope :by_assessor, ->(name) { where(assessor_name: name) }
end
