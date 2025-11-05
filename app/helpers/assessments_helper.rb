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
    recommendations = "Recommendations: Locked gates can slow emergency responders. If the lock cannot be cut, 
                       responders will not be able to get fires engines to your structure and 
                       may decide that defense is too risky. If you must have a locked gate 
                       make sure your local fire agencies have the key or combonation."
    case value
    when 1 then "No locked gate"
    when 2 then "Locked gate with combo/key available - #{recommendations}"
    when 3 then "Locked gate / no access - #{recommendations}"
    else "Not assessed"
    end
  end
  
  def gate_score(value)
    Assessment::SCORE_WEIGHTS[:gate][value]
  end
  
  def ing_egg_display(value)
    recommendations = "Why this is important: One-way In/Out roads can make access and egress for emergency responders more risky. If the road is cut off, 
                       either by fire or falling trees, firefighters could potentially be trapped and may decide 
                       that defense is too risky."
    case value
    when 1 then "Two or more roads in/out"
    when 2 then "One road in/out - #{recommendations}"
    else "Not assessed"
    end
  end
  
  def ing_egg_score(value)
    Assessment::SCORE_WEIGHTS[:ing_egg][value]
  end
  
  def road_cond_display(value)
    steep = "Why this is important: A steep slope may make it difficult for heavy equipment such as engines and dozer to access your property."
    muddy = "Why this is important: Un-surfaced roads may prevent access for emergency vehicles in the Spring when the ground is thawing, 
             or during summertime thunderstorms. "
    muddy_and_steep = "Why this is important: Un-surfaced, steep roads may prevent access for emergency vehicles."
    case value
    when 1 then "All weather road, grade < 10%"
    when 2 then "All weather, grade > 10% - #{steep}"
    when 3 then "Dry weather road, grade < 10% - #{muddy}"
    when 4 then "Dry weather road, grade > 10% - #{muddy_and_steep}"
    else "Not assessed"
    end
  end
  
  def road_cond_score(value)
    Assessment::SCORE_WEIGHTS[:road_cond][value]
  end
  
  def bridge_weight_display(value)
    limits = "Why this is important: Heavy vehicles such as fire engines an dozer can overburden small bridges. It is important 
              that smaller bridges have weight limits posted so emergency responders can determine if they are safe to cross."
    case value
    when 1 then "No bridge or adequate"
    when 2 then "Bridge with weight limits - #{limits}"
    else "Not assessed"
    end
  end
  
  def bridge_weight_score(value)
    Assessment::SCORE_WEIGHTS[:bridge_weight][value]
  end
  
  def driveway_width_display(value)
    narrow = "Why it's important: If the road is not wide enough for vehicles to pass this could affect egress."
    inaccessible = "Why it's important: If emergency responders are unable to access your structure with a fire 
                    engine it limits the defensive actions they can take." 
    case value
    when 1 then "Inaccessible - #{inaccessible}"
    when 2 then "15 feet or less - #{narrow}"
    when 3 then "16 feet or more"
    else "Not assessed"
    end
  end
  
  def driveway_width_score(value)
    Assessment::SCORE_WEIGHTS[:driveway_width][value]
  end
  
  def drivelen_display(value)
    inaccessible = "Why it's important: If emergency responders are unable to access your structure with a fire 
                    engine it limits the defensive actions they can take." 
    case value
    when 1 then "Inaccessible - #{inaccessible}"
    when 2 then "Less than 150 feet"
    when 3 then " Greater than 150 feet"
    else "Not assessed"
    end
  end
  
  def drivelen_score(value)
    Assessment::SCORE_WEIGHTS[:drivelen][value]
  end
  
  def turn_display(value)
    inadequate = "Why it's important: If emergency responders are unable to turnaround they will have 
                  to back in or out and that could slow response and threaten egress."
    case value
    when 1 then "Adequate turnaround"
    when 2 then "No adequate turnaround - #{inadequate}"
    else "Not assessed"
    end
  end
  
  def turn_score(value)
    Assessment::SCORE_WEIGHTS[:turn][value]
  end
  
  # Structure Assessment Display Methods
  def roof_display(value)
    recommendations = "Recommendations:  The roof is the most vulnerable point on a structure. 
                      Replacing shake shingles with fire resistant shingles 
                      will help harden your structure against fire brands."
    case value
    when 1 then "Metal, tile, or other non-combustible"
    when 2 then "Composite shingles"
    when 3 then "Wood shake/shingles - #{recommendations}" 
                
    else "Not assessed"
    end
  end
  
  def roof_score(value)
    Assessment::SCORE_WEIGHTS[:roof][value]
  end
  
  def clean_display(value)
    recommendations = "Recommendations: Fire brands can ignite debris on your roof and in your gutters, 
                      which can then ignite the roof. Be sure roofs and gutters are clean from leaves, 
                      conifer needles, and other debris."
    case value
    when 1 then "Clean of debris"
    when 2 then "Scattered combustibles < 1/2 inch depth -  #{recommendations}"
    when 3 then "Debris on roof > 1/2 inch or gutters clogged - #{recommendations}"
    else "Not assessed"
    end
  end
  
  def clean_score(value)
    Assessment::SCORE_WEIGHTS[:clean][value]
  end
  
  def eaves_display(value)
    recommendations = "Recommendations: Eaves may be a path for blowing fire brands to enter the structure. 
             Boxing in eaves or intalling fire resistant mesh will provide a barrier to embers."
    case value
    when 1 then "Boxed or fire treated"
    when 2 then "Open, not fire treated - #{recommendations}"
    when 3 then "Not used"
    else "Not assessed"
    end
  end
  
  def eaves_score(value)
    Assessment::SCORE_WEIGHTS[:eaves][value]
  end
  
  def vents_display(value)
    recommendations = "Recommendations: Vents are a path for fire brands to enter the structure. 
                       Exterior attic vents and soffit vents should be fitted with 1/8 inch or 
                       less wire mesh to prevent embers from entering and igniting the interior 
                       of the structure."
    case value
    when 1 then "Screened with mesh 1/8 inch or less"
    when 2 then "Screened 1/4 inch - #{recommendations}"
    when 3 then "Not screened or mesh greater than 1/4 inch - #{recommendations}"
    when 4 then "No vents"
    else "Not assessed"
    end
  end
  
  def vents_score(value)
    Assessment::SCORE_WEIGHTS[:vents][value]
  end
  
  def bld_ext_display(value)
    recommendations = "Recommendations: Your siding material is vulnerable to direct flames and may be 
                       receptible to blowing embers. It is very important that you have no combustible 
                       material within 5 feet of your structure to limit to potential for ignition of 
                       the siding. Additionally, it is ideal to have at least 12 inches on non-combustible 
                       material to the base of your siding to prevent collecting embers from igniting the siding."   
    case value
    when 1 then "Non-combustible"
    when 2 then "Logs, Timbers, Smooth Wood, vinyl - #{recommendations}"
    when 3 then "Wood shake or Ember Receptive Siding - #{recommendations}"
    else "Not assessed"
    end
  end
  
  def bld_ext_score(value)
    Assessment::SCORE_WEIGHTS[:bld_ext][value]
  end
  
  def decks_display(value)
    recommendations = "Recommendations: If your deck ignites it could spread to your sturcture. It is important to 
                       keep your deck clear of combustible objects and vegetation. Never store combustible materials such 
                       as firewood under your deck. Enclosing the deck help prevent debris and embers from collecting under 
                       the deck."
    case value
    when 1 then "None or Non-combustible"
    when 2 then "Combustible - Enclosed underneath - " + recommendations
    when 3 then "Combustible - Open underneath - " + recommendations
    else "Not assessed"
    end
  end
  
  def decks_score(value)
    Assessment::SCORE_WEIGHTS[:decks][value]
  end
  
  def comb_mat_display(value)
    recommendations = "Recommendations: It is very important to keep the area within 5 feet of the structure completely clear 
                       all combustible material. Blowing embers can accumulate next to the structure and ignite these materials, 
                       which can then ignite the structure. Firewood should be stacked at least 30 feet from the structure."
    case value
    when 1 then "None"
    when 2 then "Yes, there are combustibles near the structure - " + recommendations
    else "Not assessed"
    end
  end
  
  def comb_mat_score(value)
    Assessment::SCORE_WEIGHTS[:comb_mat][value]
  end
  
  def propane_display(value)
    recommendations = "Recommendations: Propane tanks and heating oil tanks are designed to vent 
                       when they overheat from direct flame impingement to prevent a BLEVE 
                       (boiling liquid exanding vapor explosion). When they vent they typically 
                       shoot a stream on fire out of the top of the tank. If the tank is too 
                       close to the structure, it could ignite the eaves or siding. Propane 
                       tanks should be at least 30 feet from the structure. It is important to keep 
                       combustibles at least 10 feet away from fuel tanks."
    case value
    when 1 then "Adequate clearance or no propane"
    when 2 then "Inadequate clearance - " + recommendations
    else "Not assessed"
    end
  end
  
  def propane_score(value)
    Assessment::SCORE_WEIGHTS[:propane][value]
  end
  
  def site_water_display(value)
    recommendations = "Recommendations: Fire hoses and sprinklers are very effective at keeping 
                       wildfire from igniting structure by cooling embers and wetting fine 
                       vegetation such as grass before it can ignite. If there is a plentiful 
                       water source near the structures firefighters can set up portable pumps 
                       or refill their engines providing continuous defense. If firefighters 
                       run out of water they may need to leave to find another water source 
                       and may not be able to return."
    case value
    when 1 then "Available (pool, pond, tank)"
    when 2 then "None or not sufficient - " + recommendations
    else "Not assessed"
    end
  end
  
  def site_water_score(value)
    Assessment::SCORE_WEIGHTS[:site_water][value]
  end
  
  # Vegetation Assessment Display Methods
  def fveg_z1_display(value)
    recommendations = "Recommendations: The area within 30 feet of the structure is often called 
                       the Home Ignition Zone. If trees within this to zone ignite they may rain 
                       tens of thousands of embers on the structure. The best way to prevent a 
                       crown fire near your structure is to remove ladder fuels to prevent surface 
                       fire from spreading to the canopy, and increase spacing between trees to prevent 
                       fire from spreading through the canopy independent of a surface fire. A minimum 
                       of 10 foot crown spacing is recommended. Trees should be at least 10 feet from 
                       structure and from powerlines."
    case value
    when 1 then "None or greater than 10 ft spacing"
    when 2 then "6-10 ft spacing - " + recommendations
    when 3 then "Less than 6 ft spacing - " + recommendations
    else "Not assessed"
    end
  end
  
  def fveg_z1_score(value)
    Assessment::SCORE_WEIGHTS[:fveg_z1][value]
  end
  
  def sveg_z1_display(value)
    grass = "Recommendations: Fire can move rapidly through light fuels such as grass and forbs. 
             When it is dry, grass is very receptive to spot fires from blowing embers. Fires in 
             tall grass can be extremely intense. Tactically, sprinklers, hoses, and burnout 
             operations can be effective in grass. If possible, keep the grass mowed or grazed. 
             Short grass is still receptive to embers but shorter flame lengths may be more 
             manageable. Be sure the area within 5 feet of the structure is free of grass and other 
             combustibles."
    brush = "Recommendations: Depending on the type, brush and shrubs can facilitate extreme fire 
             behavior and may be difficult for firefighters to control. They may also acts as ladder 
             fuels to allow fire to spread from the surface to the canopy. Ornamental shrubs close 
             to a structure can be very dangerous. Some shrubs are more fire resistant and may be 
             a great replace volitile ornamental shrubs. Species vary by region and may require 
             research. It is important there are no shrubs or other combustibles within 5 feet of 
             the structure."
    light_dead_down = "Recommendations: Dead, woody debris such as branches , woodchips, and bark dust 
                 can sustain combustion, even after a surface fire has moved through. Though decaying
                 branches may be healthy for the soil, they can become very receptive to embers 
                 during dry conditions. Needles cast and bark dust may smolder for a long time. 
                 Remove all leaves, conifer needles, dead wood, bark mulch, and other debris within 30 
                 feet of the structure. And be sure that there are no combustible materials within 5 
                 feet of the structure."
    heavt_dead_down = "Recomendations: Heavy dead and down woody debris such as branches and logs can 
                       sustain combustion for a long time after a flaming front moves through and 
                       increase the intensity of a surface fire. The may have high flame lengths and 
                       can spread fire from the surface to the crowns of trees. Fires in these fuels 
                       may be very difficult to control, even with heavy equipment such as dozers. 
                       Remove all leaves, conifer needles, dead wood, bark mulch, and other debris 
                       within 30 feet of the structure. And be sure that there are no combustible 
                       materials within 5 feet of the structure. "
    case value
    when 1 then "Lawn, mowed grass, or Non-combustible"
    when 2 then "Wild grass, not mowed - " + grass 
    when 3 then "Brush - " + brush
    when 4 then "Dead and down woody material (Scattered, light, includes bark dust) - " + light_dead_down
    when 5 then "Dead and down woody material (Abundant, heavy, continuous) - " + heavt_dead_down
    else "Not assessed"
    end
  end
  
  def sveg_z1_score(value)
    Assessment::SCORE_WEIGHTS[:sveg_z1][value]
  end
  
  def lad_fl1_display(value)
    recommendations = "Recommendations: Vegetation that helps carry the fire from the surface into the 
                       crowns are called ladder fuels. We can prevent fire spreading from the surface 
                       to the crowns of trees by removing these ladder fuels, creating a fuel break 
                       between the surface and the canopy. Removing brush, small trees, and tree limbs 
                       near the ground  within that 30 foot zone is one of the best ways to prevent a 
                       crown fire next to your structure. Trees taller than 18 feet should be limbed 
                       six feet from the ground. For trees less than 18 feet, remove branches 1/3 the 
                       height of the tree."
    case value
    when 1 then "None present"
    when 2 then "Scattered - " + recommendations
    when 3 then "Abundant - " + recommendations
    else "Not assessed"
    end
  end
  
  def lad_fl1_score(value)
    Assessment::SCORE_WEIGHTS[:lad_fl1][value]
  end
  
  def fveg_z2_display(value)
    recommendations = "Recommendations: If possible, thin or limb trees within the 30 - 100 foot 
    zone to prevent a crown fire which maybe threaten firefighter safety and escape routes."
    case value
    when 1 then "None or greater than 10 ft spacing"
    when 2 then "6-10 ft spacing - " + recommendations
    when 3 then "Less than 6 ft spacing - " + recommendations
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
    aligned = "Why this is important: Fire typically spreads up slope and with the wind. When the 
              wind blowing directly upslope can lead to a rapid increase in rate of spread and fire 
              behavior. Canyons can funnle and concentrate the wind increasing rate of spread."
    case value
    when 1 then "Not in alignment with slope/canyon"
    when 2 then "In alignment with slope/canyon - " + aligned
    else "Not assessed"
    end
  end
  
  def struct_alignment_score(value)
    Assessment::SCORE_WEIGHTS[:struct_alignment][value]
  end
  
  def slope_display(value)
    slope = "Why this is important: Fire move more rapidly uphill. The steeper the slope, the fast 
             the faster the rate of spread. Fires can spread uphill faster than people, or even 
             vehicles to can, and is a common denominator and many firefighter fatalities."
    case value
    when 1 then "Less than 10% slope"
    when 2 then "10-20% slope - " + slope
    when 3 then "21-30% slope - " + slope
    when 4 then "Greater than 30% slope - " + slope
    else "Not assessed"
    end
  end
  
  def slope_score(value)
    Assessment::SCORE_WEIGHTS[:slope][value]
  end
  
  def setback_display(value)
    setback = "Why it is important: Fire can move rapidly upslope and with great intensity. The closer 
               a structure is to a slope the more likely it will be affected by the super heated flaming 
               front."
    case value
    when 1 then "Greater than 30 feet"
    when 2 then "10-30 feet - " + setback
    when 3 then "Less than 10 feet - " + setback
    else "Not assessed"
    end
  end
  
  def setback_score(value)
    Assessment::SCORE_WEIGHTS[:setback][value]
  end
  
  def pos_slope_display(value)
    pos_slope = "Why it is important: Fire tends to accelerate as it moves upslope increasing in intensity. 
                    Fire behavior is usually higher further up the slope."
    case value
    when 1 then "Bottom"
    when 2 then "Lower 1/3"
    when 3 then "Mid slope - " + pos_slope
    when 4 then "Upper 1/3 or ridge - " + pos_slope
    else "Not assessed"
    end
  end
  
  def pos_slope_score(value)
    Assessment::SCORE_WEIGHTS[:pos_slope][value]
  end
  
  def aspect_display(value)
    aspect = "Why it is important: Aspect is the direct a slope is facing toward the sun. Aspect affects 
              the amount of sunline a slope receives, how dry it is, and what type of vegetation grows 
              and therefore has a marked affect on fire behavior.  "
    north = " North facing slopes receive the least amount of sunlight throughout the year and tend to be 
            cooler and wetter than other aspect. Though they tend to have highe fuel loads, they typically 
            have less intense fire behavior than other aspects."
    east = " East slopes receive sunlight earliest in the day and may experience an increase in fire 
            behavior before other aspects. However, they also also shaded earlier and may not receive 
            direct sunlight during the peak burn period."
    south = " South slopes receive the most direct sunlight throughout the year and tend to have lower 
            fuel moisture and more light, flashy fuels such as grass and brush. South facing slopes tend 
            to experience the greatest fire behavior"
    west = " West facing slopes receive sunlight later in the day. Though they are not usually as hot and 
            dry as South slopes, they receive more direct sunlight during the peak burn period and may have 
            higher fuels loads. West facing slope experience some of the greatest fire behavior. "
    case value
    when 1 then "Flat"
    when 2 then "North - " + aspect + north
    when 3 then "East - "  + aspect + east
    when 4 then "South - " + aspect + south
    when 5 then "West - "  + aspect + west
    else "Not assessed"
    end
  end
  
  def aspect_score(value)
    Assessment::SCORE_WEIGHTS[:aspect][value]
  end
end
