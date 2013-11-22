inherit Map_P Presentation
method Map_P constructor {control} {
  this inherited $control
}

inherit Map Control
method Map constructor {parent MapFrame } {
  Map_P ${objName}_P $objName

  #Héritage
  this inherited $parent "" ${objName}_P ""
}