


inherit PlaneteMiniMap_A Abstraction
method PlaneteMiniMap_A constructor {control} {
  this inherited $control
}

inherit PlaneteMiniMap_P Presentation
method PlaneteMiniMap_P constructor {control} {
  
}

inherit PlaneteMiniMap Control
method PlaneteMiniMap constructor {parent minimapcanevas} {
  PlaneteMiniMap_P ${objName}_P $objName
  PlaneteMiniMap_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""

}
# Generate_PAC_accessors Control Planete_Map_A Planete_Map_P ${objName};

