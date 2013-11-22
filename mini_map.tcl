inherit MiniMap_P Presentation
method MiniMap_P constructor {control miniMapCanvas} {
  this inherited $control
}

inherit MiniMap Control
method MiniMap constructor {parent miniMapCanvas} {
  MiniMap_P ${objName}_P $objName $miniMapCanvas

  this inherited $parent "" ${objName}_P ""
}
#Generate_PAC_accessors Control MiniMap_A MiniMap_P m;