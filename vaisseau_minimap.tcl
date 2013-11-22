inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control} {
  
}

inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {parent } {
  VaisseauMiniMap_P ${objName}_P $objName


  #Héritage
  this inherited $parent "" ${objName}_P ""
}

#Manque GETTER ET SETTER
