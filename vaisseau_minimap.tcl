


inherit Vaisseau_MiniMap_A Abstraction
method Vaisseau_MiniMap_A constructor {control} {
  this inherited $control
}

inherit Vaisseau_MiniMap_P Presentation
method Vaisseau_MiniMap_P constructor {control} {
  
}

inherit Vaisseau_MiniMap Control
method Vaisseau_MiniMap constructor { } {
  Vaisseau_MiniMap_P ${objName}_P $objName
  Vaisseau_MiniMap_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER
Generate_PAC_accessors Control Vaisseau_MiniMap_A Vaisseau_MiniMap_P ${objName}
