inherit VaisseauInfo_P Presentation
method VaisseauInfo_P constructor {control infoCanevas x y color}  {
  
}

inherit VaisseauInfo Control
method VaisseauInfo constructor {parent infoCanvas x y color} {
  VaisseauInfo_P ${objName}_P $objName $infoCanvas $x $y $color

  #Héritage
  this inherited $parent "" ${objName}_P ""
  
	# Declaration PAC fils

}

#Manque GETTER ET SETTER

