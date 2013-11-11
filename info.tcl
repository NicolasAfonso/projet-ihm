inherit Info_A Abstraction
method Info_A constructor {control} {
}

inherit Info_P Presentation
method Info_P constructor {control} {
  this inherited $control
}

inherit Info Control
method Info constructor { } {
  Info_P ${objName}_P $objName
  Info_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
}

#Manque GETTER ET SETTER