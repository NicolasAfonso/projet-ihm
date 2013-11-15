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

#Manque GETTER ET SETTER
inherit myGen Generator
method myGen GEN_set_VALUE { val} {
	set this(VALUE) $val
}

myGen g
g gen Minimap_P valeur