inherit VaisseauInfo_P Presentation
method VaisseauInfo_P constructor {control} {
  
}

inherit VaisseauInfo Control
method VaisseauInfo constructor {parent } {
  VaisseauInfo_P ${objName}_P $objName

  #Héritage
  this inherited $parent "" ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER

