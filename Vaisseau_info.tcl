


inherit VaisseauInfo_A Abstraction
method VaisseauInfo_A constructor {control} {
  this inherited $control
}

inherit VaisseauInfo_P Presentation
method VaisseauInfo_P constructor {control} {
  
}

inherit VaisseauInfo Control
method VaisseauInfo constructor {parent } {
  VaisseauInfo_P ${objName}_P $objName
  VaisseauInfo_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER

