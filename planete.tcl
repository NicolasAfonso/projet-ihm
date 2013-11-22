source Planete_map.tcl
source Planete_minimap.tcl
source Planete_info.tcl

inherit Planete_A Abstraction
method Planete_A constructor {control kernel} {
  this inherited $control
  #set this(FC) $FC ;#cmd param 1 param2 
}

inherit Planete Control
method Planete constructor {parent kernel mapCanvas minimapCanvas infoCanvas} {

  Planete_A ${objName}_A $objName $kernel
  
  
	# Declaration PAC fils
	# pour un Planete, on a 1 Planete map, 1 Planete mini map, 1 Planete info
	PlaneteMap ${objName}_PM $objName $mapCanvas;
	PlaneteMiniMap ${objName}_PMM $objName $minimapCanvas;
	PlaneteInfo ${objName}_PI $objName $infoCanvas
	
	this inherited $parent ${objName}_A "" [list ${objName}_PM ${objName}_PMM ${objName}_PI]
}
# Generate_PAC_accessors Planete Planete_A Planete_P radius