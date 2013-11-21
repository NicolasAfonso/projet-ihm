


inherit PlaneteMap_A Abstraction
method PlaneteMap_A constructor {control} {
  this inherited $control
}

inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control} {
  
}

inherit PlaneteMap Control
method PlaneteMap constructor {parent minimapcanevas } {
  PlaneteMap_P ${objName}_P $objName
  PlaneteMap_A ${objName}_A $objName
  this inherited $parent ${objName}_A ${objName}_P ""

}
# Generate_PAC_accessors Control Planete_Map_A Planete_Map_P ${objName};

