inherit Info_P Presentation
method Info_P constructor {control} {
  this inherited $control
}

inherit Info Control
method Info constructor {parent infoFrame } {
  Info_P ${objName}_P $objName

  #Héritage
  this inherited $parent "" ${objName}_P "" 
}

#Manque GETTER ET SETTER