source Planete_map.tcl
source Planete_minimap.tcl
source Planete_info.tcl

inherit Planete_A Abstraction
method Planete_A constructor {control} {
  this inherited $control
}

inherit Planete_P Presentation
method Planete_P constructor {control} {
  
}

inherit Planete Control
method Planete constructor { } {
  Planete_P ${objName}_P $objName
  Planete_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils
	# pour un Planete, on a 1 Planete map, 1 Planete mini map, 1 Planete info
	PlaneteMap ${objName}_PM $objName;
	PlaneteMiniMap ${objName}_PMM $objName;
	PlaneteInfo ${objName}_PI $objName;
}
Generate_PAC_accessors Control Planete Planete ${objName};