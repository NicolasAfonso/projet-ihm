source Vaisseau_map.tcl
source Vaisseau_minimap.tcl
source Vaisseau_info.tcl

inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control} {
  this inherited $control
}

inherit Vaisseau Control
method Vaisseau constructor {parent } {
  Vaisseau_A ${objName}_A $objName
 
	# Declaration PAC fils
	# pour un Vaisseau, on a 1 Vaisseau map, 1 Vaisseau mini map, 1 Vaisseau info
	VaisseauMap ${objName}_VM $objName;
	VaisseauMiniMap ${objName}_VMM $objName;
	VaisseauInfo ${objName}_VI $objName;


	this inherited $parent ${objName}_A "" [list ${objName}_VM ${objName}_VMM ${objName}_VI]
}
