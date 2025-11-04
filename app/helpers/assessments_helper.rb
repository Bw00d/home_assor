# app/helpers/assessments_helper.rb
module AssessmentsHelper
  # Risk score color helper
  def risk_score_color(score)
    case score
    when -Float::INFINITY...-10
      "text-green-600"
    when -10...0
      "text-yellow-600"
    when 0...10
      "text-orange-600"
    else
      "text-red-600"
    end
  end
  
  # Check if assessment has any firefighter risks
  def has_firefighter_risks?(assessment)
    assessment.firefighter_risk_count > 0
  end
  
  # Access Assessment Display Methods
  def gate_display(value)
    case value
    when 1 then "No locked gate"
    when 2 then "Locked gate with combo/key available"
    when 3 then "Locked gate - no access"
    else "Not assessed"
    end
  end
  
  def gate_score(value)
    Assessment::SCORE_WEIGHTS[:gate][value]
  end
  
  def ing_egg_display(value)
    case value
    when 1 then "Two or more roads in/out"
    when 2 then "One road in/out"
    else "Not assessed"
    end
  end
  
  def ing_egg_score(value)
    Assessment::SCORE_WEIGHTS[:ing_egg][value]
  end
  
  def road_cond_display(value)
    case value
    when 1 then "All weather road, grade < 10%"
    when 2 then "All weather, grade > 10%"
    when 3 then "Dry weather road, grade < 10%"
    when 4 then "Dry weather road, grade > 10%"
    else "Not assessed"
    end
  end
  
  def road_cond_score(value)
    Assessment::SCORE_WEIGHTS[:road_cond][value]
  end
  
  def bridge_weight_display(value)
    case value
    when 1 then "No bridge or adequate"
    when 2 then "Bridge with weight limits"
    else "Not assessed"
    end
  end
  
  def bridge_weight_score(value)
    Assessment::SCORE_WEIGHTS[:bridge_weight][value]
  end
  
  def driveway_width_display(value)
    case value
    when 1 then "Inaccessible"
    when 2 then "15 feet or less"
    when 3 then "16 feet or more"
    else "Not assessed"
    end
  end
  
  def driveway_width_score(value)
    Assessment::SCORE_WEIGHTS[:driveway_width][value]
  end
  
  def drivelen_display(value)
    case value
    when 1 then "Inaccessible"
    when 2 then "< 150 feet"
    when 3 then " > 150 feet"
    else "Not assessed"
    end
  end
  
  def drivelen_score(value)
    Assessment::SCORE_WEIGHTS[:drivelen][value]
  end
  
  def turn_display(value)
    case value
    when 1 then "Adequate turnaround"
    when 2 then "No adequate turnaround"
    else "Not assessed"
    end
  end
  
  def turn_score(value)
    Assessment::SCORE_WEIGHTS[:turn][value]
  end
  
  # Structure Assessment Display Methods
  def roof_display(value)
    case value
    when 1 then "Metal, tile, or other non-combustible"
    when 2 then "Composition"
    when 3 then "Wood shake/shingle"
    else "Not assessed"
    end
  end
  
  def roof_score(value)
    Assessment::SCORE_WEIGHTS[:roof][value]
  end
  
  def clean_display(value)
    case value
    when 1 then "Clean of debris"
    when 2 then "Scattered combustibles < 1/2 inch depth"
    when 3 then "Debris on roof > 1/2 inch or gutters clogged"
    else "Not assessed"
    end
  end
  
  def clean_score(value)
    Assessment::SCORE_WEIGHTS[:clean][value]
  end
  
  def eaves_display(value)
    case value
    when 1 then "Boxed or fire treated"
    when 2 then "Open, not fire treated"
    when 3 then "Not used"
    else "Not assessed"
    end
  end
  
  def eaves_score(value)
    Assessment::SCORE_WEIGHTS[:eaves][value]
  end
  
  def vents_display(value)
    case value
    when 1 then "Screened < 1/8 inch"
    when 2 then "Screened 1/4 inch"
    when 3 then "Not screened or > 1/4 inch"
    when 4 then "No vents"
    else "Not assessed"
    end
  end
  
  def vents_score(value)
    Assessment::SCORE_WEIGHTS[:vents][value]
  end
  
  def bld_ext_display(value)
    case value
    when 1 then "Non-combustible"
    when 2 then "Logs, Timbers, Smooth Wood, vinyl"
    when 3 then "Wood shake or Ember Receptive Siding"
    else "Not assessed"
    end
  end
  
  def bld_ext_score(value)
    Assessment::SCORE_WEIGHTS[:bld_ext][value]
  end
  
  def decks_display(value)
    case value
    when 1 then "None or Non-combustible"
    when 2 then "Combustible - Enclosed underneath"
    when 3 then "Combustible - Open underneath"
    else "Not assessed"
    end
  end
  
  def decks_score(value)
    Assessment::SCORE_WEIGHTS[:decks][value]
  end
  
  def comb_mat_display(value)
    case value
    when 1 then "None"
    when 2 then "Yes"
    else "Not assessed"
    end
  end
  
  def comb_mat_score(value)
    Assessment::SCORE_WEIGHTS[:comb_mat][value]
  end
  
  def propane_display(value)
    case value
    when 1 then "Adequate clearance or no propane"
    when 2 then "Inadequate clearance"
    else "Not assessed"
    end
  end
  
  def propane_score(value)
    Assessment::SCORE_WEIGHTS[:propane][value]
  end
  
  def site_water_display(value)
    case value
    when 1 then "Available (pool, pond, tank)"
    when 2 then "None or not sufficient"
    else "Not assessed"
    end
  end
  
  def site_water_score(value)
    Assessment::SCORE_WEIGHTS[:site_water][value]
  end
  
  # Vegetation Assessment Display Methods
  def fveg_z1_display(value)
    case value
    when 1 then "None or > 10 ft spacing"
    when 2 then "6-10 ft spacing"
    when 3 then "< 6 ft spacing"
    else "Not assessed"
    end
  end
  
  def fveg_z1_score(value)
    Assessment::SCORE_WEIGHTS[:fveg_z1][value]
  end
  
  def sveg_z1_display(value)
    case value
    when 1 then "Lawn, mowed grass, or Non-combustible"
    when 2 then "Wild grass, not mowed"
    when 3 then "Brush"
    when 4 then "Dead and down woody material (Scattered, light, includes bark dust)"
    when 5 then "Dead and down woody material (Abundant, heavy, continuous)"
    else "Not assessed"
    end
  end
  
  def sveg_z1_score(value)
    Assessment::SCORE_WEIGHTS[:sveg_z1][value]
  end
  
  def lad_fl1_display(value)
    case value
    when 1 then "None present"
    when 2 then "Scattered"
    when 3 then "Abundant"
    else "Not assessed"
    end
  end
  
  def lad_fl1_score(value)
    Assessment::SCORE_WEIGHTS[:lad_fl1][value]
  end
  
  def fveg_z2_display(value)
    case value
    when 1 then "None or > 10 ft spacing"
    when 2 then "6-10 ft spacing"
    when 3 then "< 6 ft spacing"
    else "Not assessed"
    end
  end
  
  def fveg_z2_score(value)
    Assessment::SCORE_WEIGHTS[:fveg_z2][value]
  end
  
  def sveg_z2_display(value)
    case value
    when 1 then "Lawn, mowed grass, or Non-combustible"
    when 2 then "Wild grass, not mowed"
    when 3 then "Brush"
    when 4 then "Dead and down woody material (Scattered, light, includes bark dust)"
    when 5 then "Dead and down woody material (Abundant, heavy, continuous)"
    else "Not assessed"
    end
  end
  
  def sveg_z2_score(value)
    Assessment::SCORE_WEIGHTS[:sveg_z2][value]
  end
  
  def lad_fuel_2_display(value)
    case value
    when 1 then "None present"
    when 2 then "Scattered"
    when 3 then "Abundant"
    else "Not assessed"
    end
  end
  
  def lad_fuel_2_score(value)
    Assessment::SCORE_WEIGHTS[:lad_fuel_2][value]
  end
  
  # Topography Assessment Display Methods
  def contfuel_display(value)
    case value
    when 1 then "Continuous"
    when 2 then "Sparse"
    else "Not assessed"
    end
  end
  
  def contfuel_score(value)
    Assessment::SCORE_WEIGHTS[:contfuel][value]
  end
  
  def struct_alignment_display(value)
    case value
    when 1 then "Not in alignment with slope/canyon"
    when 2 then "In alignment with slope/canyon"
    else "Not assessed"
    end
  end
  
  def struct_alignment_score(value)
    Assessment::SCORE_WEIGHTS[:struct_alignment][value]
  end
  
  def slope_display(value)
    case value
    when 1 then "< 10%"
    when 2 then "10-20%"
    when 3 then "21-30%"
    when 4 then "> 30%"
    else "Not assessed"
    end
  end
  
  def slope_score(value)
    Assessment::SCORE_WEIGHTS[:slope][value]
  end
  
  def setback_display(value)
    case value
    when 1 then "> 30 feet"
    when 2 then "10-30 feet"
    when 3 then "< 10 feet"
    else "Not assessed"
    end
  end
  
  def setback_score(value)
    Assessment::SCORE_WEIGHTS[:setback][value]
  end
  
  def pos_slope_display(value)
    case value
    when 1 then "Bottom"
    when 2 then "Lower 1/3"
    when 3 then "Mid slope"
    when 4 then "Upper 1/3 or ridge"
    else "Not assessed"
    end
  end
  
  def pos_slope_score(value)
    Assessment::SCORE_WEIGHTS[:pos_slope][value]
  end
  
  def aspect_display(value)
    case value
    when 1 then "Flat"
    when 2 then "North"
    when 3 then "East"
    when 4 then "South"
    when 5 then "West"
    else "Not assessed"
    end
  end
  
  def aspect_score(value)
    Assessment::SCORE_WEIGHTS[:aspect][value]
  end
end
