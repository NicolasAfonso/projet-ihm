source Vaisseau_map.tcl
source Vaisseau_minimap.tcl
source Vaisseau_info.tcl

inherit Vaisseau_A Abstraction
method Vaisseau_A constructor {control} {
  this inherited $control
}

inherit Vaisseau_P Presentation
method Vaisseau_P constructor {control} {
  
}

inherit Vaisseau Control
method Vaisseau constructor { } {
  Vaisseau_P ${objName}_P $objName
  Vaisseau_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils
	# pour un Vaisseau, on a 1 Vaisseau map, 1 Vaisseau mini map, 1 Vaisseau info
	VaisseauMap ${objName}_CP $objName;
	VaisseauMiniMap ${objName}_U $objName;
	VaisseauInfo ${objName}_J $objName;

}

#Manque GETTER ET SETTER