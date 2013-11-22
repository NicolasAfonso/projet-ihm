inherit PlaneteMap_P Presentation
method PlaneteMap_P constructor {control} {
  
}

inherit PlaneteMap Control
method PlaneteMap constructor {parent minimapcanevas } {
  PlaneteMap_P ${objName}_P $objName


  #Héritage
  this inherited $parent "" ${objName}_P ""

}
# Generate_PAC_accessors Control Planete_Map_A Planete_Map_P ${objName};

