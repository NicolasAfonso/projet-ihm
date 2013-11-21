


inherit VaisseauMiniMap_A Abstraction
method VaisseauMiniMap_A constructor {control} {
  this inherited $control
}

inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control} {
  
}

inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {parent } {
  VaisseauMiniMap_P ${objName}_P $objName
  VaisseauMiniMap_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER
