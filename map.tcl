inherit Map_A Abstraction
method Map_A constructor {control} {
}

inherit Map_P Presentation
method Map_P constructor {control} {
  this inherited $control
}

inherit Map Control
method Map constructor {parent MapFrame } {
  Map_P ${objName}_P $objName
  Map_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""
}