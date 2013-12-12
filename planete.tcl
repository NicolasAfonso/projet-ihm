source Planete_map.tcl
source Planete_minimap.tcl
source Planete_info.tcl
source assesor_generator.tcl

inherit Planete_A Abstraction
method Planete_A constructor {control kernel x y radius density} {
  this inherited $control
  set this(kernel) $kernel
  set this(id) [$kernel Add_new_planet $x $y $radius $density]


}

inherit Planete Control
method Planete constructor {parent kernel mapCanvas minimapCanvas infoCanvas x y radius density} {

  Planete_A ${objName}_A $objName $kernel $x $y $radius $density
  
  
	# Declaration PAC fils
	# pour un Planete, on a 1 Planete map, 1 Planete mini map, 1 Planete info
	PlaneteMap ${objName}_PM $objName $mapCanvas $x $y $radius
	PlaneteMiniMap ${objName}_PMM $objName $minimapCanvas $x $y $radius
	PlaneteInfo ${objName}_PI $objName $infoCanvas $x $y
	
	this inherited $parent ${objName}_A "" [list ${objName}_PM ${objName}_PMM ${objName}_PI]
}

Generate_PAC_accessors Planete Planete_A "" id