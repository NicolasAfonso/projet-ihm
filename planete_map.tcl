


inherit Planete_Map_A Abstraction
method Planete_Map_A constructor {control} {
  this inherited $control
}

inherit Planete_Map_P Presentation
method Planete_Map_P constructor {control} {
  
}

inherit Planete_Info Control
method Planete_Info constructor { } {
  Planete_Info_P ${objName}_P $objName
  Planete_Info_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER

