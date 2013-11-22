source Vaisseau_map.tcl
source Vaisseau_minimap.tcl
source Vaisseau_info.tcl

inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control kernel} {
  this inherited $control
}

inherit Vaisseau Control
method Vaisseau constructor {parent kernel mapCanvas miniMapCanvas infoCanvas} {
    Vaisseau_A ${objName}_A $objName $kernel 
 
	# Declaration PAC fils
	# pour un Vaisseau, on a 1 Vaisseau map, 1 Vaisseau mini map, 1 Vaisseau info

	#VaisseauMap parent mapCanvas
	VaisseauMap ${objName}_VM $objName $mapCanvas

	#VaisseauMiniMap parent miniMapCanvas
	VaisseauMiniMap ${objName}_VMM $objName $miniMapCanvas

	#VaisseauInfo parent infoCanvas
	VaisseauInfo ${objName}_VI $objName $infoCanvas


	this inherited $parent ${objName}_A "" [list ${objName}_VM ${objName}_VMM ${objName}_VI]
}
