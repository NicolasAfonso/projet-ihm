inherit MiniMap_A Abstraction
method MiniMap_A constructor {control} {
}

inherit MiniMap_P Presentation
method MiniMap_P constructor {control} {
  this inherited $control
}

inherit MiniMap Control
method MiniMap constructor { } {
  MiniMap_P ${objName}_P $objName
  MiniMap_A ${objName}_A $objName
  this inherited "" ${objName}_A ${objName}_P ""
}
Generate_PAC_accessors Control MiniMap_A MiniMap_P ${objName};