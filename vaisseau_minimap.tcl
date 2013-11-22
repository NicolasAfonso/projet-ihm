inherit VaisseauMiniMap_P Presentation
method VaisseauMiniMap_P constructor {control miniMapCanevas} {
  
}

inherit VaisseauMiniMap Control
method VaisseauMiniMap constructor {parent miniMapCanvas} {
  VaisseauMiniMap_P ${objName}_P $objName $miniMapCanvas


  #Héritage
  this inherited $parent "" ${objName}_P ""
}

#Manque GETTER ET SETTER
