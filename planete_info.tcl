inherit PlaneteInfo_P Presentation
method PlaneteInfo_P constructor {control} {
  
}

inherit PlaneteInfo Control
method PlaneteInfo constructor {parent infoframe} {
  PlaneteInfo_P ${objName}_P $objName


  #Héritage
  this inherited $parent "" ${objName}_P ""


}
# Generate_PAC_accessors Control Planete_Info_A Planete_Info_P ${objName};

