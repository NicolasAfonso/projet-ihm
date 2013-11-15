

inherit Vaisseau_Map_A Abstraction
method Vaisseau_Map_A constructor {control} {
  this inherited $control
}

inherit Vaisseau_Map_P Presentation
method Vaisseau_Map_P constructor {control} {
  
}

inherit Vaisseau_Map Control
method Vaisseau_Map constructor { } {
  Vaisseau_Map_P ${objName}_P $objName
  Vaisseau_Map_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER
