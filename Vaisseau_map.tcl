

inherit VaisseauMap_A Abstraction
method VaisseauMap_A constructor {control} {
  this inherited $control
}

inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control} {
  
}

inherit VaisseauMap Control
method VaisseauMap constructor {parent } {
  VaisseauMap_P ${objName}_P $objName
  VaisseauMap_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER
