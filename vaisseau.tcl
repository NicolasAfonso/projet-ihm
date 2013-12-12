source Vaisseau_map.tcl
source Vaisseau_minimap.tcl
source Vaisseau_info.tcl
source assesor_generator.tcl

inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control kernel playerId x y} {
  this inherited $control
  set this(id) [$kernel Add_new_ship $playerId $x $y 10]

  $kernel Update_ship $playerId $this(id) [dict create fire_velocity 5 fire_angle 500]
}

inherit Vaisseau Control
method Vaisseau constructor {parent kernel mapCanvas miniMapCanvas infoCanvas playerid x y color} {
    Vaisseau_A ${objName}_A $objName $kernel $playerid $x $y 
 
	# Declaration PAC fils
	# pour un Vaisseau, on a 1 Vaisseau map, 1 Vaisseau mini map, 1 Vaisseau info

	#VaisseauMap parent mapCanvas
	VaisseauMap ${objName}_VM $objName $mapCanvas $x $y $color

	#VaisseauMiniMap parent miniMapCanvas
	VaisseauMiniMap ${objName}_VMM $objName $miniMapCanvas $x $y $color

	#VaisseauInfo parent infoCanvas
	VaisseauInfo ${objName}_VI $objName $infoCanvas $x $y $color


	this inherited $parent ${objName}_A "" [list ${objName}_VM ${objName}_VMM ${objName}_VI]
}

Generate_PAC_accessors Vaisseau Vaisseau_A "" id