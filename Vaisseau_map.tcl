inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control mapCanvas} {
  
}

inherit VaisseauMap Control
method VaisseauMap constructor {parent mapCanvas } {
  VaisseauMap_P ${objName}_P $objName $mapCanvas 

  #Héritage
  this inherited $parent "" ${objName}_P ""

}

#Manque GETTER ET SETTER
