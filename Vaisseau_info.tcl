inherit VaisseauInfo_P Presentation
method VaisseauInfo_P constructor {control infoCanevas}  {
  
}

inherit VaisseauInfo Control
method VaisseauInfo constructor {parent infoCanvas} {
  VaisseauInfo_P ${objName}_P $objName $infoCanvas

  #Héritage
  this inherited $parent "" ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER

