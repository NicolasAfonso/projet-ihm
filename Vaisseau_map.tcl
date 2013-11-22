inherit VaisseauMap_P Presentation
method VaisseauMap_P constructor {control} {
  
}

inherit VaisseauMap Control
method VaisseauMap constructor {parent } {
  VaisseauMap_P ${objName}_P $objName

  #Héritage
  this inherited $parent "" ${objName}_P ""

}

#Manque GETTER ET SETTER
