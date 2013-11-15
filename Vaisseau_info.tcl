


inherit Vaisseau_Info_A Abstraction
method Vaisseau_Info_A constructor {control} {
  this inherited $control
}

inherit Vaisseau_Info_P Presentation
method Vaisseau_Info_P constructor {control} {
  
}

inherit Vaisseau_Info Control
method Vaisseau_Info constructor { } {
  Vaisseau_Info_P ${objName}_P $objName
  Vaisseau_Info_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER

Generate_PAC_accessors Control Vaisseau_Info_A Vaisseau_Info_P ${objName}