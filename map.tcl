inherit Map_P Presentation
method Map_P constructor {control mapCanvas} {
  this inherited $control
}

inherit Map Control
method Map constructor {parent mapCanvas} {
  Map_P ${objName}_P $objName $mapCanvas

  #Héritage
  this inherited $parent "" ${objName}_P ""
}