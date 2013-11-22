inherit Info_P Presentation
method Info_P constructor {control infoCanvas} {
  this inherited $control
}

inherit Info Control
method Info constructor {parent infoCanvas} {
  Info_P ${objName}_P $objName $infoCanvas
  	
  #Héritage
  this inherited $parent "" ${objName}_P "" 
}

#Manque GETTER ET SETTER